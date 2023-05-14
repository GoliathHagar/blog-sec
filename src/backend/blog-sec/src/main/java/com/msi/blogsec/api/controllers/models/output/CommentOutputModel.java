package com.msi.blogsec.api.controllers.models.output;

import com.msi.blogsec.data.Author;
import com.msi.blogsec.data.Comment;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.domain.constants.CommentStatus;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.Builder;
import lombok.Getter;
import org.springframework.hateoas.RepresentationModel;
import org.yaml.snakeyaml.representer.Represent;

import java.time.LocalDateTime;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/12/23, Friday, 6:31 PM
 **/

@Builder
@Getter
public class CommentOutputModel extends RepresentationModel<CommentOutputModel> {
    private final String user;
    private final String content;
    private final String parentCommentId;
    private final LocalDateTime createdAt;
}
