package com.msi.blogsec.data;

import com.msi.blogsec.domain.constants.CommentStatus;
import jakarta.persistence.*;

import java.time.LocalDateTime;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 4/19/23, Wednesday, 1:08 PM
 **/

@Entity(name = "comments")
public class Comment {
    @Id private String id;
    @ManyToOne private Post post;
    @ManyToOne private Author user;
    @OneToOne private Comment commentParentId;

    private String content;
    @Enumerated(EnumType.STRING) private CommentStatus status;

    private LocalDateTime createdAt;


}
