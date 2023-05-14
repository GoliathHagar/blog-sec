package com.msi.blogsec.api.controllers.assemblers;

import com.msi.blogsec.api.controllers.CommentController;
import com.msi.blogsec.api.controllers.PostController;
import com.msi.blogsec.api.controllers.models.output.CommentOutputModel;
import com.msi.blogsec.data.Comment;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/14/23, Sunday, 5:58 PM
 **/

@Component
public class CommentAssembler extends RepresentationModelAssemblerSupport<Comment, CommentOutputModel> {
    public CommentAssembler() { super(CommentController.class, CommentOutputModel.class);}

    @Override
    public CommentOutputModel toModel(Comment entity) {

        final String parentComment = entity.getCommentParentId() != null? entity.getCommentParentId().getId(): "";

        return CommentOutputModel.builder()
                .user(entity.getUser().getName())
                .content(entity.getContent())
                .createdAt(entity.getCreatedAt())
                .parentCommentId(parentComment)
                .build()
                .add(
                        linkTo(
                               methodOn(PostController.class).postById(entity.getPost().getId())
                        ).withRel("post")
                );
    }
}
