package com.msi.blogsec.domain;

import com.msi.blogsec.data.Post;
import com.msi.blogsec.data.PostRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 3/21/23, Tuesday, 10:49 AM
 **/

@Service
public class BlogServices {
    final PostRepository postRepository;

    public Post fn(String id){

        return  postRepository.findById(id).orElseThrow(RuntimeException::new);
    }


    public BlogServices(PostRepository postRepository) {
        this.postRepository = postRepository;
    }
}
