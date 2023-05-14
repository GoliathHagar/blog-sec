package com.msi.blogsec.api.controllers.assemblers;

import com.msi.blogsec.api.controllers.CommentController;
import com.msi.blogsec.api.controllers.PostController;
import com.msi.blogsec.api.controllers.models.output.PostOutputModel;
import com.msi.blogsec.data.Author;
import com.msi.blogsec.data.Post;
import org.springframework.data.domain.Pageable;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/12/23, Friday, 6:40 PM
 **/

@Component
public class PostAssembler extends RepresentationModelAssemblerSupport<Post, PostOutputModel> {
    public PostAssembler(){
        super(PostAssembler.class, PostOutputModel.class);
    }


    @Override
    public PostOutputModel toModel(Post entity) {

        String author = (entity.getAuthor() != null)? entity.getAuthor().getName(): "";

        return PostOutputModel.builder()
                .author(author)
                .title(entity.getTitle())
                .content(entity.getContent())
                .status(entity.getStatus())
                .commentAllowed(entity.isCommentAllowed())
                .tags(entity.getTags())
                .publishedAt(entity.getPublishedAt())
                .createdAt(entity.getCreatedAt())
                .updatedAt(entity.getUpdatedAt())
                .build()
                .add(
                        linkTo(
                                methodOn(PostController.class).postById(entity.getId())
                        ).withSelfRel()
                )
                .add(
                        linkTo(
                                methodOn(CommentController.class).getCommentOnPost(entity.getId(), Pageable.unpaged())
                        ).withRel("comments")
                );
    }
}
