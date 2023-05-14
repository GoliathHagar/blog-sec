package com.msi.blogsec.data;

import com.msi.blogsec.domain.constants.PostStatus;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Set;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 3/21/23, Tuesday, 10:48 AM
 **/


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity(name = "posts")
public class Post {
    @Id private String id;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL) private Author author;
    private String title;
    private String content;
    @Enumerated(EnumType.STRING) private PostStatus status;
    private boolean commentAllowed;
    private String tags;
    @OneToMany(mappedBy = "post", fetch = FetchType.LAZY) private Set<Comment> comments;
    private LocalDateTime publishedAt;
    private LocalDateTime updatedAt;
    private LocalDateTime createdAt;
}





