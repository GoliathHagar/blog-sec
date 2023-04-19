package com.msi.blogsec.api.controllers;

import com.msi.blogsec.data.Post;
import com.msi.blogsec.domain.BlogServices;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 3/21/23, Tuesday, 10:45 AM
 **/

@RestController
@RequestMapping(value = "/", produces = {MediaType.APPLICATION_JSON_VALUE})
public class Home {
    BlogServices services;

    @GetMapping
    ResponseEntity<String> home(){
        final String home = "this is home api";

        return ResponseEntity.ok(home);
    }
    @GetMapping("/post/{id}")
    ResponseEntity<Post> home(@PathVariable String id){
        final Post post = services.fn(id);

        return ResponseEntity.ok(post);
    }

    public Home(BlogServices services) {
        this.services = services;
    }
}
