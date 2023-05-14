package com.msi.blogsec.data;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 4/19/23, Wednesday, 1:22 PM
 **/
public interface AuthorRepository  extends JpaRepository<Author, String> {
    Optional<Author> findByJwtUserId(String jwtUserId);
}
