package com.msi.blogsec;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;


@SpringBootApplication(exclude = { ErrorMvcAutoConfiguration.class})
public class BlogSecApplication {

	public static void main(String[] args) {
		SpringApplication.run(BlogSecApplication.class, args);
	}
}
