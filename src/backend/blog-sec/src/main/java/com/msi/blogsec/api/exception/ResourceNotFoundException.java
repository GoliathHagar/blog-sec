package com.msi.blogsec.api.exception;

import org.hibernate.annotations.Immutable;
import org.zalando.problem.AbstractThrowableProblem;
import org.zalando.problem.Status;
import org.zalando.problem.StatusType;

import java.net.URI;
import java.util.Map;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 4/19/23, Wednesday, 7:32 PM
 **/
@Immutable
public class ResourceNotFoundException  extends AbstractThrowableProblem {
    private final String resource;

    public ResourceNotFoundException(String resource) {
        this.resource = resource;
    }

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
        return "Post " + resource + " does not exists";
    }
}
