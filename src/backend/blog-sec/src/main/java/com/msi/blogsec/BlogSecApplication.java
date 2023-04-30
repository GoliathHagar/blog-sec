package com.msi.blogsec;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.data.PostRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.context.annotation.Bean;


@SpringBootApplication(exclude = { ErrorMvcAutoConfiguration.class})
public class BlogSecApplication {

	public static void main(String[] args) {
		SpringApplication.run(BlogSecApplication.class, args);
	}


	@Bean
	public boolean data(PostRepository repository){
		Post post = new Post();
		post.setId("claudia");
		repository.save(post);

		return true;
	}

}
