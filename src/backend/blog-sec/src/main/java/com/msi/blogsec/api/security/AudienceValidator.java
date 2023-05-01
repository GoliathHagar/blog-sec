package com.msi.blogsec.api.security;

import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidatorResult;
import org.springframework.security.oauth2.jwt.Jwt;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/1/23, Monday, 1:25 PM
 **/
public class AudienceValidator implements OAuth2TokenValidator<Jwt> {
    private final String audience;

    public AudienceValidator(String audience) {
        this.audience = audience;
    }

    @Override
    public OAuth2TokenValidatorResult validate(Jwt token) {
        OAuth2TokenValidatorResult res;

        final String errorCode = "invalid_token";
        final String description = "The required audience is missing";
        final OAuth2Error error = new OAuth2Error(errorCode, description, null);

        return (token != null && token.getAudience().contains(audience))?
                OAuth2TokenValidatorResult.success(): OAuth2TokenValidatorResult.failure(error);
    }
}
