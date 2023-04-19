package com.msi.blogsec.data;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 4/19/23, Wednesday, 1:22 PM
 **/
public interface CommentRepository extends JpaRepository<Comment, String> {
}
