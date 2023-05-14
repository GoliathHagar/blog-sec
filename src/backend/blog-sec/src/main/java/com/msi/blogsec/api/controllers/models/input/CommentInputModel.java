package com.msi.blogsec.api.controllers.models.input;

import jakarta.validation.constraints.NotBlank;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/12/23, Friday, 9:11 AM
 **/


public record CommentInputModel(@NotBlank String content, String parentCommentId) {
}
