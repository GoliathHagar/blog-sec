package com.msi.blogsec.domain;

import com.msi.blogsec.api.controllers.models.input.PostInputModel;
import com.msi.blogsec.api.security.helpers.SecurityHelper;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.domain.constants.PostStatus;
import com.msi.blogsec.domain.models.PostSearchParams;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;

import static org.mockito.Mockito.when;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/24/23, Wednesday, 4:10 PM
 **/
@TestPropertySource("/test.properties")
@SpringBootTest
class PostServicesTest {

    @Autowired
    PostServices postServices;

    @MockBean
    SecurityHelper securityHelper;

    @BeforeEach
    void setUp() {
    }

    @Test
    void getPosts() {
        when(securityHelper.jwtSubId()).thenReturn("user-id");
        when(securityHelper.getclaims("name")).thenReturn("user name");
        when(securityHelper.getclaims("email")).thenReturn("user@name.com");

        postServices.createPost(new PostInputModel("test",
                "content", PostStatus.PUBLISHED, true, "tag"));


        Page<Post> posts = postServices.getPosts(Pageable.ofSize(1), PostSearchParams.builder()
                .status(PostStatus.PUBLISHED).build());

        Assertions.assertEquals(1, posts.getSize());
    }

    @Test
    void getById() {

        Assertions.assertTrue(true);
    }

    @Test
    void createPost() {

        Assertions.assertTrue(true);
    }

    @Test
    void updatePost() {

        Assertions.assertTrue(true);
    }

    @Test
    void removePost() {

        Assertions.assertTrue(true);
    }
}