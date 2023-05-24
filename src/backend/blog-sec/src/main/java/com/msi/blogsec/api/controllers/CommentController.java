package com.msi.blogsec.api.controllers;

import com.msi.blogsec.api.constants.Endpoints;
import com.msi.blogsec.api.controllers.assemblers.CommentAssembler;
import com.msi.blogsec.api.controllers.models.input.CommentInputModel;
import com.msi.blogsec.api.controllers.models.output.CommentOutputModel;
import com.msi.blogsec.api.security.constants.Authorities;
import com.msi.blogsec.data.Comment;
import com.msi.blogsec.domain.CommentService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.hateoas.PagedModel;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/10/23, Wednesday, 6:55 PM
 **/
@RestController
@RequestMapping(value = Endpoints.ROOT+Endpoints.COMMENT,
        produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
@AllArgsConstructor
public class CommentController {

    private final CommentService commentService;
    private final CommentAssembler assembler;
    private final PagedResourcesAssembler<Comment> pagedResourcesAssembler;


    @GetMapping("/{postId}")
    @PreAuthorize(Authorities.PERMISSION_PERMIT_ALL)
    public ResponseEntity<PagedModel<CommentOutputModel>> getCommentOnPost(@PathVariable String postId) {

        Page<Comment> comments = commentService.getCommentsOnPost(postId);

        return ResponseEntity.ok(pagedResourcesAssembler.toModel(comments, assembler));

    }

    @PostMapping("/{postId}")
    @PreAuthorize(Authorities.CREATE_COMMENT)
    public ResponseEntity<CommentOutputModel> addComment(@Valid @RequestBody CommentInputModel data, @PathVariable String postId) {

        Comment comment = commentService.addCommenttoPost(postId, data);

        return ResponseEntity.ok(assembler.toModel(comment));

    }

}
