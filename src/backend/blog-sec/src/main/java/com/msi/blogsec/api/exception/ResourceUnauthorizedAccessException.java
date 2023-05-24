package com.msi.blogsec.api.exception;

import org.zalando.problem.Status;
import org.zalando.problem.StatusType;
import org.zalando.problem.ThrowableProblem;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/13/23, Saturday, 4:49 PM
 **/

public class ResourceUnauthorizedAccessException extends ThrowableProblem {
    @Override
    public String getTitle() {
        return Status.UNAUTHORIZED.name();
    }

    @Override
    public StatusType getStatus() {
        return Status.UNAUTHORIZED;
    }

    @Override
    public String getDetail() {
        return "Do not have permitions to access this resource";
    }
}
