package com.msi.blogsec.data;

import com.msi.blogsec.domain.constants.AuthorStatus;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 4/19/23, Wednesday, 12:13 PM
 **/
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity(name = "authors")
public class Author {
    @Id  private String jwtUserId;
    private String name;
    private String email;
    @Enumerated(EnumType.STRING) private AuthorStatus status;
    private LocalDateTime updatedAt;
    private LocalDateTime createdAt;
}
