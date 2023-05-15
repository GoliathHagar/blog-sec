package com.msi.blogsec.api.security.constants;


/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/1/23, Monday, 1:41 PM
 **/

public class Authorities { //system permitions should be instanciate here
    private Authorities() {
    }

    public static final String PERMISSION_PERMIT_ALL = "permitAll";
    public static final String PERMISSION_AUTHENTICATED = "isAuthenticated()";

    public static final String EDIT_POST = "hasAuthority('edit:post')";
    public static final String REMOVE_POST = "hasAuthority('remove:post')";
    public static final String CREATE_POST = "hasAuthority('create:post')";

    public static final String REMOVE_COMMENT = "hasAuthority('remove:comment')";
    public static final String CREATE_COMMENT = "hasAuthority('create:comment')";

}
