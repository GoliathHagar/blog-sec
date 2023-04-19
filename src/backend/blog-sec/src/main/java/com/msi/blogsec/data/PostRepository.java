package com.msi.blogsec.data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 3/23/23, Thursday, 6:33 PM
 **/

@Repository
public interface PostRepository extends JpaRepository<Post, String > {

}
