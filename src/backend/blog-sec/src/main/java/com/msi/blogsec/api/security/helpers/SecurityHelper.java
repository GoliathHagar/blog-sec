package com.msi.blogsec.api.security.helpers;

import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;


/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/1/23, Monday, 2:08 PM
 **/
@Component
@AllArgsConstructor
public class SecurityHelper {

    public String jwtSubId() {
        return getclaims("sub");
    }

    public String getclaims(String key){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication!= null && authentication.isAuthenticated()
                && authentication.getPrincipal() instanceof Jwt token) {

            return token.getClaims().get(key).toString();
        } else {
            return null;
        }
    }


}
