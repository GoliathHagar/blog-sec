package com.msi.blogsec.api.controllers.models.output;


import lombok.Builder;
import lombok.Getter;
import org.springframework.hateoas.RepresentationModel;

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
