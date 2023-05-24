package com.msi.blogsec.api.exception;

import lombok.AllArgsConstructor;
import org.zalando.problem.Status;
import org.zalando.problem.StatusType;
import org.zalando.problem.ThrowableProblem;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 4/19/23, Wednesday, 7:32 PM
 **/
@AllArgsConstructor
public class ResourceNotFoundException extends ThrowableProblem {
    private final String resource;

    @Override
    public String getTitle() {
        return Status.NOT_FOUND.name();
    }

    @Override
    public StatusType getStatus() {
        return Status.NOT_FOUND;
    }

    @Override
    public String getDetail() {
        return resource + " does not exists";
    }
}
