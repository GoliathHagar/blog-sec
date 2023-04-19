package com.msi.blogsec.data;

import com.msi.blogsec.domain.constants.PostStatus;
import jakarta.persistence.*;

import java.time.LocalDateTime;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 3/21/23, Tuesday, 10:48 AM
 **/

@Entity(name = "posts")
public class Post {
    @Id private String id;
    @ManyToOne private Author author;
    private String title;
    @Column( columnDefinition = "longtext")
    private String content;
    @Enumerated(EnumType.STRING)
    private PostStatus status;
    private boolean commentAllowed;
    private String tags;
    private LocalDateTime publishedAt;
    private LocalDateTime updatedAt;
    private LocalDateTime createdAt;

    public Post(String id, Author author, String title, String content, PostStatus status, boolean commentAllowed,
                String tags, LocalDateTime publishedAt, LocalDateTime updatedAt, LocalDateTime createdAt) {
        this.id = id;
        this.author = author;
        this.title = title;
        this.content = content;
        this.status = status;
        this.commentAllowed = commentAllowed;
        this.tags = tags;
        this.publishedAt = publishedAt;
        this.updatedAt = updatedAt;
        this.createdAt = createdAt;
    }

    public Post() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public PostStatus getStatus() {
        return status;
    }

    public void setStatus(PostStatus status) {
        this.status = status;
    }

    public boolean isCommentAllowed() {
        return commentAllowed;
    }

    public void setCommentAllowed(boolean commentAllowed) {
        this.commentAllowed = commentAllowed;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public LocalDateTime getPublishedAt() {
        return publishedAt;
    }

    public void setPublishedAt(LocalDateTime publishedAt) {
        this.publishedAt = publishedAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
