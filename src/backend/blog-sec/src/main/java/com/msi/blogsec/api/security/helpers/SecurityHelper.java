package com.msi.blogsec.api.security.helpers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/1/23, Monday, 2:08 PM
 **/
public class SecurityHelper {
    public String validatePrincipal() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            System.out.println("Authorities");
            authentication.getAuthorities().forEach(System.out::println);
            return authentication.getName();
        } else {
            return "";
        }
    }
}
