package com.msi.blogsec.api.security.helpers;

import org.springframework.core.convert.converter.Converter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/1/23, Monday, 3:11 PM
 **/
public class KeycloakRealmRoleConverter implements Converter<Jwt, Collection<GrantedAuthority>> {

    private String resourceName = null;
    private boolean roleForRealm = true;

    protected KeycloakRealmRoleConverter(){}

    public KeycloakRealmRoleConverter(boolean roleForRealm, String resourceName) {
        this.roleForRealm = roleForRealm;
        this.resourceName = resourceName;
    }

    private static final String REALM_ACCESS = "realm_access";
    private static final String RESOURCE_ACCESS = "resource_access";
    private static final String ROLES = "roles";
    private static final String ROLE_PREFIX = "";

    @Override
    public Collection<GrantedAuthority> convert(Jwt jwt) {
        Map<String, Object> access;
        Objects.requireNonNull(jwt);


        if (!roleForRealm && resourceName != null) {
            access = (Map<String, Object>) jwt.getClaims().get(RESOURCE_ACCESS);
            if (access != null && access.containsKey(resourceName)) {
                access = (Map<String, Object>) access.get(resourceName);
            }
        } else {
            access = (Map<String, Object>) jwt.getClaims().get(REALM_ACCESS);
        }
        List<String> roles = (List<String>) access.get(ROLES);

        return roles.stream()
                .map(roleName -> ROLE_PREFIX + roleName)
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
    }
}
