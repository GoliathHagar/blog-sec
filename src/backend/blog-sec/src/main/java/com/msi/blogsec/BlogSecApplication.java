package com.msi.blogsec;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.msi.blogsec.data.Author;
import com.msi.blogsec.data.AuthorRepository;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.data.PostRepository;
import com.msi.blogsec.domain.constants.AuthorStatus;
import com.msi.blogsec.domain.constants.PostStatus;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.context.annotation.Bean;

import java.time.LocalDateTime;


@SpringBootApplication(exclude = { ErrorMvcAutoConfiguration.class})
public class BlogSecApplication {

	public static void main(String[] args) {
		SpringApplication.run(BlogSecApplication.class, args);
	}


	/*@Bean
	public boolean data(PostRepository repository, AuthorRepository authorRepository){
		Author author = Author.builder()
				.jwtUserId("8cb164d1-d7d6-4fc4-8c94-4325bb63cca2")
				.name("A T")
				.email("A@A.A")
				.status(AuthorStatus.ACTIVE)
				.updatedAt(LocalDateTime.now())
				.createdAt(LocalDateTime.now())
				.build();

		authorRepository.save(author);

		Post post = Post.builder()
				.id("1")
				.author(author)
				.status(PostStatus.PUBLISHED)
				.title("Test")
				.tags("t")
				.content("This is a test post")
				.commentAllowed(true)
				.publishedAt(LocalDateTime.now())
				.updatedAt(LocalDateTime.now())
				.createdAt(LocalDateTime.now())
				.build();

		Post post2 = Post.builder()
				.id("2")
				.author(author)
				.status(PostStatus.DRAFT)
				.title("Test 2")
				.tags("t")
				.content("This is a test post")
				.commentAllowed(true)
				.publishedAt(LocalDateTime.now())
				.updatedAt(LocalDateTime.now())
				.createdAt(LocalDateTime.now())
				.build();

		repository.save(post);
		repository.save(post2);

		return true;
	}
*/
}
