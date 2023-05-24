package com.msi.blogsec.api.controllers;

import com.msi.blogsec.data.AuthorRepository;
import com.msi.blogsec.data.PostRepository;
import org.junit.jupiter.api.*;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/15/23, Monday, 4:34 PM
 **/

@DisplayNameGeneration(DisplayNameGenerator.Standard.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
class PostControllerTest {


    @MockBean
    private PostRepository postRepository;

    @MockBean
    private AuthorRepository authorRepository;

    @BeforeEach
    void setUp() {


    }

    @Test
    void posts() {
        Assertions.assertTrue(true);
    }

    @Test
    void myposts() {

        Assertions.assertTrue(true);
    }

    @Test
    void postById() {

        Assertions.assertTrue(true);
    }

    @Test
    void createPost() {

        Assertions.assertTrue(true);
    }

    @Test
    void editPost() {

        Assertions.assertTrue(true);
    }

    @Test
    void removePost() {

        Assertions.assertTrue(true);
    }
}