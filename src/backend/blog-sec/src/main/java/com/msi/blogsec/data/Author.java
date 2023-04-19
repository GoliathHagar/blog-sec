package com.msi.blogsec.data;

import com.msi.blogsec.domain.constants.AuthorStatus;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;

import java.time.LocalDateTime;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 4/19/23, Wednesday, 12:13 PM
 **/
@Entity(name = "authors")
public class Author {
    @Id  private String jwtUserId;
    private String name;
    private String email;
    @Enumerated(EnumType.STRING) private AuthorStatus status;;
    private LocalDateTime updatedAt;
    private LocalDateTime createdAt;

    public Author(String jwtUserId, String name, String email, AuthorStatus status) {
        this.jwtUserId = jwtUserId;
        this.name = name;
        this.email = email;
        this.status = status;
    }

    protected Author() {

    }

    public String getJwtUserId() {
        return jwtUserId;
    }

    public void setJwtUserId(String jwtUserId) {
        this.jwtUserId = jwtUserId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public AuthorStatus getStatus() {
        return status;
    }

    public void setStatus(AuthorStatus status) {
        this.status = status;
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
