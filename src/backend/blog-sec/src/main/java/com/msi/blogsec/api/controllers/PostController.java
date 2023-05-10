package com.msi.blogsec.api.controllers;

import com.msi.blogsec.api.security.constants.Authorities;
import com.msi.blogsec.api.security.helpers.SecurityHelper;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.domain.BlogServices;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/10/23, Wednesday, 6:54 PM
 **/
@RestController
@RequestMapping(value = "/posts", produces = MediaType.APPLICATION_JSON_VALUE)
public class PostController {

    private final BlogServices services;

    @GetMapping("/post/{id}")
    @PreAuthorize(Authorities.EDIT_POST)
    ResponseEntity<Post> postById(@PathVariable String id){
        final SecurityHelper home = new SecurityHelper();

        final Post post = services.fn(id);

        return ResponseEntity.ok(post);
    }

    public PostController(BlogServices services) {
        this.services = services;
    }
}
