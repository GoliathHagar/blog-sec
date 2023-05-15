package com.msi.blogsec.api.controllers.models.output;

import com.msi.blogsec.domain.constants.PostStatus;
import lombok.Builder;
import lombok.Getter;
import org.springframework.hateoas.RepresentationModel;

import java.time.LocalDateTime;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/12/23, Friday, 6:29 PM
 **/

@Builder
@Getter
public class PostOutputModel extends RepresentationModel<PostOutputModel> {
    private final String author;
    private final String title;
    private final String content;
    private final PostStatus status;
    private final boolean commentAllowed;
    private final String tags;
    private final LocalDateTime publishedAt;
    private final LocalDateTime updatedAt;
    private final LocalDateTime createdAt;
}
