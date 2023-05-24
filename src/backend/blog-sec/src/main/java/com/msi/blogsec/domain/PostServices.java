package com.msi.blogsec.domain;

import com.msi.blogsec.api.controllers.models.input.PostInputModel;
import com.msi.blogsec.api.exception.ResourceNotFoundException;
import com.msi.blogsec.api.exception.ResourceUnauthorizedAccessException;
import com.msi.blogsec.api.security.helpers.SecurityHelper;
import com.msi.blogsec.data.Author;
import com.msi.blogsec.data.AuthorRepository;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.data.PostRepository;
import com.msi.blogsec.domain.constants.AuthorStatus;
import com.msi.blogsec.domain.constants.CommentStatus;
import com.msi.blogsec.domain.constants.PostStatus;
import com.msi.blogsec.domain.models.PostSearchParams;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/12/23, Friday, 9:51 AM
 **/

@Service
@AllArgsConstructor
public class PostServices {
    private final PostRepository postRepository;
    private final AuthorRepository authorRepository;
    private final SecurityHelper securityHelper;

    public Page<Post> getPosts(Pageable pageable, PostSearchParams searchParams) {

        return postRepository.findAll(new PostSearchSpecificator(searchParams), pageable);
    }

    public Post getById(String id) {

        Post post = postRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException("post"));

        String author = post.getAuthor() != null ? post.getAuthor().getJwtUserId(): "";
        boolean isPublished = post.getStatus().equals(PostStatus.PUBLISHED);
        boolean isCurrentUserAuthor = author.equals(securityHelper.jwtSubId());

        if (isPublished || isCurrentUserAuthor) {
            return  post;
        }
        else
            throw new ResourceUnauthorizedAccessException();
    }

    public Post createPost(PostInputModel pIModel) {
        String jwtId = securityHelper.jwtSubId();

        if(jwtId.isEmpty()) throw new ResourceNotFoundException("Jwt Author");
        LocalDateTime tic = LocalDateTime.now();

        Author author = authorRepository.findByJwtUserId(jwtId).orElse(
                Author.builder()
                        .jwtUserId(jwtId)
                        .name(securityHelper.getclaims("name"))
                        .email(securityHelper.getclaims("email"))
                        .status(AuthorStatus.ACTIVE)
                        .createdAt(tic)
                        .updatedAt(tic)
                        .build()
        );

        if(author.getCreatedAt().equals(tic)) authorRepository.save(author);

        Post post = Post.builder()
                .id(UUID.randomUUID().toString())
                .author(author)
                .title(pIModel.title())
                .content(pIModel.content())
                .status(PostStatus.DRAFT)
                .commentAllowed(pIModel.commentAllowed())
                .tags(pIModel.tags())
                .createdAt(tic)
                .updatedAt(tic)
                .build();

        return postRepository.save(post);
    }

    public Post updatePost(String id, PostInputModel pIModel) {
        String jwtId = securityHelper.jwtSubId();

        LocalDateTime tic = LocalDateTime.now();

        Post post = postRepository.findById(id).orElseThrow(()-> new ResourceNotFoundException("Post"));

        if (!post.getAuthor().getJwtUserId().equals(jwtId)) throw new ResourceUnauthorizedAccessException();

        post.setTitle(pIModel.title());
        post.setContent(pIModel.content());
        post.setCommentAllowed(pIModel.commentAllowed());
        post.setTags(post.getTags());

        if (!post.getStatus().equals(PostStatus.PUBLISHED) && !post.getStatus().equals(pIModel.status()))
            post.setPublishedAt(tic);

        post.setStatus(pIModel.status());
        post.setUpdatedAt(tic);


        return postRepository.save(post);
    }

    public void removePost(String id) {
        //identify users ownership
        String jwtId = securityHelper.jwtSubId();

        Post post = postRepository.findById(id).orElseThrow(()-> new ResourceNotFoundException("Post"));

        if (!post.getAuthor().getJwtUserId().equals(jwtId)) throw new ResourceUnauthorizedAccessException();

        //remove post and its comments
        post.setStatus(PostStatus.REMOVED);

        post.getComments().forEach(comment -> comment.setStatus(CommentStatus.REMOVED));

        postRepository.save(post);

    }
}
