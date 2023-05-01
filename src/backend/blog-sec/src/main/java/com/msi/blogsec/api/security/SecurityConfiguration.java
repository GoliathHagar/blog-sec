package com.msi.blogsec.api.security;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.zalando.problem.spring.web.advice.security.SecurityProblemSupport;

import static org.springframework.security.config.Customizer.withDefaults;

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
//@Import(SecurityProblemSupport::class)
public class SecurityConfiguration {
    //private SecurityProblemSupport problemSupport;

    @Value("${auth.audience}")
    private String audience;

    @Value("${spring.security.oauth2.resourceserver.jwt.issuer-uri}")
    private String issuer;

    @Value("${auth.resource-name}")
    protected String resourceName;

    @Value("${auth.for-realm}")
    protected boolean roleForRealm = true;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests((authz) -> authz
                        .anyRequest().permitAll()
                )
                .httpBasic(withDefaults());
        return http.build();
    }


}
