package com.msi.blogsec.api.security;

import com.msi.blogsec.api.constants.Endpoints;
import com.msi.blogsec.api.security.helpers.KeycloakRealmRoleConverter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.oauth2.core.DelegatingOAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.jwt.*;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.zalando.problem.spring.web.advice.security.SecurityProblemSupport;

import java.util.List;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/1/23, Monday, 2:11 PM
 **/

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@Import(SecurityProblemSupport.class)
public class SecurityConfiguration {
    private final SecurityProblemSupport problemSupport;

    public SecurityConfiguration(SecurityProblemSupport problemSupport) {
        this.problemSupport = problemSupport;
    }

    @Value("${auth.audience}")
    private String audience="";

    @Value("${spring.security.oauth2.resourceserver.jwt.issuer-uri}")
    private String issuer="";

    @Value("${auth.resource-name}")
    protected String resourceName="";

    @Value("${auth.for-realm}")
    protected boolean roleForRealm = true;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http.authorizeHttpRequests(authz ->
                        authz.requestMatchers(new AntPathRequestMatcher(Endpoints.ROOT + "/**")).permitAll()
                                .anyRequest().denyAll()
                )
                .csrf().and()
                .cors().configurationSource(corsConfigurationSource()).and()
                .oauth2ResourceServer()
                .authenticationEntryPoint(problemSupport)
                .accessDeniedHandler(problemSupport)
                .jwt().decoder(jwtDecoder())
                .jwtAuthenticationConverter(jwtAuthenticationConverter());

        return http.build();
    }

    public JwtAuthenticationConverter jwtAuthenticationConverter() {
        JwtAuthenticationConverter jwtConverter = new JwtAuthenticationConverter();
        jwtConverter.setJwtGrantedAuthoritiesConverter(new KeycloakRealmRoleConverter(roleForRealm, resourceName));

        return jwtConverter;
    }

    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();

        configuration.setAllowedMethods(
                List.of(
                        HttpMethod.GET.name(),
                        HttpMethod.PUT.name(),
                        HttpMethod.POST.name(),
                        HttpMethod.DELETE.name()
                )
        );

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration(Endpoints.ROOT + "/**", configuration.applyPermitDefaultValues());

        return source;
    }


    @Bean
    JwtDecoder jwtDecoder() {
        NimbusJwtDecoder jwtDecoder = JwtDecoders.fromIssuerLocation(issuer);

        OAuth2TokenValidator<Jwt> audienceValidator = new AudienceValidator(audience);
        OAuth2TokenValidator<Jwt> withIssuer = JwtValidators.createDefaultWithIssuer(issuer);
        OAuth2TokenValidator<Jwt> withAudience = new DelegatingOAuth2TokenValidator<>(withIssuer, audienceValidator);

        jwtDecoder.setJwtValidator(withAudience);

        return jwtDecoder;
    }


}
