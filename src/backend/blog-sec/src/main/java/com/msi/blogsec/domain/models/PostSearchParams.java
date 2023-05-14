package com.msi.blogsec.domain.models;

import com.msi.blogsec.domain.constants.PostStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/13/23, Saturday, 2:09 PM
 **/
@AllArgsConstructor
@Builder
@Getter
public class PostSearchParams {
    PostStatus status;
    String owner;
}
