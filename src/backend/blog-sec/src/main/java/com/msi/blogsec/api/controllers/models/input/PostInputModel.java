package com.msi.blogsec.api.controllers.models.input;

import com.msi.blogsec.domain.constants.PostStatus;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/12/23, Friday, 9:28 AM
 **/

public record PostInputModel(@NotBlank String title, @NotBlank String content, @NotNull PostStatus status,
                             @NotNull boolean commentAllowed, @NotNull String tags) {
}
