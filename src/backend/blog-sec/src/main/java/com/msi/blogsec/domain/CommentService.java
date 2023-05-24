package com.msi.blogsec.domain;

import com.msi.blogsec.api.controllers.models.input.CommentInputModel;
import com.msi.blogsec.api.exception.ResourceNotFoundException;
import com.msi.blogsec.api.exception.ResourceUnauthorizedAccessException;
import com.msi.blogsec.api.security.helpers.SecurityHelper;
import com.msi.blogsec.data.*;
import com.msi.blogsec.domain.constants.AuthorStatus;
import com.msi.blogsec.domain.constants.CommentStatus;
import com.msi.blogsec.domain.constants.PostStatus;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/12/23, Friday, 9:52 AM
 **/

@Service
@AllArgsConstructor
public class CommentService {

    private final PostRepository postRepository;
    private final CommentRepository commentRepository;
    private final AuthorRepository authorRepository;
    private final SecurityHelper securityHelper;

    public Page<Comment> getCommentsOnPost(String postId) {
        Post post = postRepository.findById(postId).orElseThrow(() -> new ResourceNotFoundException("post"));

        //post is not publish comments are block or remove
        if (!post.getStatus().equals(PostStatus.PUBLISHED)) throw new ResourceNotFoundException("post");


        List<Comment> comments = post.getComments().stream()
                .filter(comment -> comment.getStatus().equals(CommentStatus.AVAILABLE))
                .sorted(Comparator.comparing(Comment::getCreatedAt)).toList();

        return new PageImpl<>(comments);
    }

    public Comment addCommenttoPost(String postId, CommentInputModel data) {
        Post post = postRepository.findById(postId).orElseThrow(() -> new ResourceNotFoundException("post"));

        if (!post.getStatus().equals(PostStatus.PUBLISHED)) throw new ResourceNotFoundException("post");

        if (!post.isCommentAllowed()) throw new ResourceUnauthorizedAccessException();

        LocalDateTime time = LocalDateTime.now();

        final String jwtId = securityHelper.jwtSubId();

        Author author = authorRepository.findByJwtUserId(jwtId).orElse(
                Author.builder()
                        .jwtUserId(securityHelper.jwtSubId())
                        .name(securityHelper.getclaims("name"))
                        .email(securityHelper.getclaims("email"))
                        .status(AuthorStatus.ACTIVE)
                        .createdAt(time)
                        .updatedAt(time)
                        .build()
        );

        if(author.getCreatedAt().equals(time)) authorRepository.save(author);

        Comment parent = null;

        if (data.parentCommentId() !=null && !data.parentCommentId().isEmpty())
            parent = commentRepository.findById(data.parentCommentId())
                    .orElseThrow(()-> new ResourceNotFoundException("Comment parent"));

        final Comment comment = Comment.builder()
                .id(UUID.randomUUID().toString())
                .post(post)
                .user(author)
                .commentParentId(parent)
                .content(data.content())
                .status(CommentStatus.AVAILABLE)
                .createdAt(time)
                .build();

        return commentRepository.save(comment);
    }

}
