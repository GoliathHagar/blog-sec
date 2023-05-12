package com.msi.blogsec.api.controllers;

import com.msi.blogsec.api.constants.Endpoints;
import com.msi.blogsec.api.controllers.models.input.PostInputModel;
import com.msi.blogsec.api.security.constants.Authorities;
import com.msi.blogsec.api.security.helpers.SecurityHelper;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.domain.BlogServices;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/10/23, Wednesday, 6:54 PM
 **/
@RestController
@RequestMapping(value = Endpoints.ROOT+Endpoints.POST,
        consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
public class PostController {

    private final BlogServices services;

    //get all posts
    @GetMapping
    @Secured({Authorities.PERMISSION_PERMIT_ALL})
    ResponseEntity posts(){


        return ResponseEntity.status(200).build();
    }


    //get post by id
    @GetMapping("/{id}")
    @PreAuthorize(Authorities.PERMISSION_PERMIT_ALL)
    ResponseEntity<Post> postById(@PathVariable String id){

        final Post post = services.fn(id);

        return ResponseEntity.ok(post);
    }

    //edit post
    @PutMapping("/{id}")
    @PreAuthorize(Authorities.PERMISSION_PERMIT_ALL)
    ResponseEntity<Post> editPost(@PathVariable String id, @RequestBody PostInputModel postInputModel){

        final Post post = services.fn(id);

        return ResponseEntity.ok(post);
    }

    //remove post
    @DeleteMapping("/{id}")
    @PreAuthorize(Authorities.PERMISSION_PERMIT_ALL)
    ResponseEntity<Post> removePost(@PathVariable String id){

        final Post post = services.fn(id);

        return ResponseEntity.ok(post);
    }


    public PostController(BlogServices services) {
        this.services = services;
    }
}
