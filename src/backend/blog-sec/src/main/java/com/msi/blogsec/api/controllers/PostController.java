package com.msi.blogsec.api.controllers;

import com.msi.blogsec.api.constants.Endpoints;
import com.msi.blogsec.api.controllers.assemblers.PostAssembler;
import com.msi.blogsec.api.controllers.models.input.PostInputModel;
import com.msi.blogsec.api.controllers.models.output.PostOutputModel;
import com.msi.blogsec.api.security.constants.Authorities;
import com.msi.blogsec.api.security.helpers.SecurityHelper;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.domain.PostServices;
import com.msi.blogsec.domain.constants.PostStatus;
import com.msi.blogsec.domain.models.PostSearchParams;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.hateoas.PagedModel;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
@AllArgsConstructor
public class PostController {

    private final PostServices postServices;
    private final PostAssembler assembler;
    private final PagedResourcesAssembler<Post> pagedResourcesAssembler;
    private final SecurityHelper securityHelper;

    //get all posts
    @GetMapping
    @PreAuthorize(Authorities.PERMISSION_PERMIT_ALL)
    public ResponseEntity<PagedModel<PostOutputModel>> posts(Pageable pageable){
        PostSearchParams search = PostSearchParams.builder()
                .status(PostStatus.PUBLISHED)
                .build();

        Page<Post> posts = postServices.getPosts(pageable, search);

        PagedModel<PostOutputModel> pagedPosts = pagedResourcesAssembler.toModel(posts, assembler);

        return ResponseEntity.ok(pagedPosts);
    }

    //get all owned posts
    @GetMapping("/owned")
    @PreAuthorize(Authorities.PERMISSION_AUTHENTICATED)
    public ResponseEntity<PagedModel<PostOutputModel>> myposts(Pageable pageable){
        PostSearchParams search = PostSearchParams.builder()
                .owner(securityHelper.jwtSubId())
                .build();

        Page<Post> posts = postServices.getPosts(pageable, search);

        PagedModel<PostOutputModel> pagedPosts = pagedResourcesAssembler.toModel(posts, assembler);

        return ResponseEntity.ok(pagedPosts);
    }


    //get post by id
    @GetMapping("/{id}")
    @PreAuthorize(Authorities.PERMISSION_PERMIT_ALL)
    public ResponseEntity<PostOutputModel> postById(@PathVariable String id){

        final Post post = postServices.getById(id);

        return ResponseEntity.ok(assembler.toModel(post));
    }

    //create post
    @PostMapping
    @PreAuthorize(Authorities.CREATE_POST)
    public ResponseEntity<PostOutputModel> createPost(@Valid @RequestBody PostInputModel postInputModel){

       final Post post = postServices.createPost(postInputModel);

        return ResponseEntity.ok(assembler.toModel(post));
    }

    //edit post
    @PutMapping("/{id}")
    @PreAuthorize(Authorities.EDIT_POST)
    public ResponseEntity<PostOutputModel> editPost(@PathVariable String id, @Valid @RequestBody PostInputModel postInputModel){

       final Post post = postServices.updatePost(id, postInputModel);

        return ResponseEntity.ok(assembler.toModel(post));
    }

    //remove post
    @DeleteMapping("/{id}")
    @PreAuthorize(Authorities.REMOVE_POST)
    public HttpEntity<?> removePost(@PathVariable String id){

       postServices.removePost(id);

        return ResponseEntity.status(HttpStatus.OK).build();
    }

}
