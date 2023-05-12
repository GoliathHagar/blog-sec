package com.msi.blogsec.api.controllers;

import com.msi.blogsec.api.controllers.models.input.CommentInputModel;
import jakarta.validation.Valid;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/10/23, Wednesday, 6:55 PM
 **/
@RestController
@RequestMapping(value = "/comments", produces = MediaType.APPLICATION_JSON_VALUE)
public class CommentController {

    @GetMapping("/post/{post_id}")
    ResponseEntity getCommentOnPost(@PathVariable String post_id){

        return ResponseEntity.status(200).build();

    }

    @GetMapping("/{comment_id}")
    ResponseEntity getComment(@PathVariable String post_id){

        return ResponseEntity.status(200).build();

    }

    @PostMapping
    ResponseEntity addComment(@Valid @RequestBody CommentInputModel data){

        return ResponseEntity.status(200).build();

    }

    @PutMapping("/{comment_id}")
    ResponseEntity editCommnet(@PathVariable String comment_id){

        return ResponseEntity.status(200).build();

    }

    @DeleteMapping("/{comment_id}")
    ResponseEntity removeComment(@PathVariable String comment_id){

        return ResponseEntity.status(200).build();

    }
}
