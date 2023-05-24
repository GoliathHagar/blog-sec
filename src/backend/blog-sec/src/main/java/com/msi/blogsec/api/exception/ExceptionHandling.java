package com.msi.blogsec.api.exception;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.NativeWebRequest;
import org.zalando.problem.Problem;
import org.zalando.problem.Status;
import org.zalando.problem.ThrowableProblem;
import org.zalando.problem.spring.web.advice.ProblemHandling;
import org.zalando.problem.violations.ConstraintViolationProblem;

import java.util.HashMap;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 4/19/23, Wednesday, 5:56 PM
 **/

@ControllerAdvice
class ExceptionHandling implements ProblemHandling {
    private static ThrowableProblem myProblem(Problem problem) {
        final HashMap<String, Object> parameters = new HashMap<>();

        if ((ConstraintViolationProblem) problem != null)
            parameters.put("violations", ((ConstraintViolationProblem) problem).getViolations());
        else
            return Problem.builder().withStatus(Status.INTERNAL_SERVER_ERROR).build();

        return Problem.builder()
                .withTitle(problem.getTitle())
                .withDetail(problem.getDetail())
                .withStatus(problem.getStatus())
                .with("parameters", parameters)
                .build();
    }

    @Override
    public ResponseEntity<Problem> process(ResponseEntity<Problem> entity, NativeWebRequest request) {
        final Problem problem = entity.getBody();
        if (problem == null)
            return new ResponseEntity<>(null, null, HttpStatus.INTERNAL_SERVER_ERROR);

        final HttpHeaders headers = entity.getHeaders();
        final Problem p = myProblem(problem);
        final int status = p.getStatus() != null ?
                p.getStatus().getStatusCode() : Status.INTERNAL_SERVER_ERROR.getStatusCode();

        return new ResponseEntity<>(p, headers, status);


    }

    @ExceptionHandler(ResourceNotFoundException.class)
    ResponseEntity<Problem> notFound(ResourceNotFoundException rnf, NativeWebRequest nativeWebRequest){
        return create(
                Problem.builder()
                        .withTitle(rnf.getTitle())
                        .withStatus(Status.NOT_FOUND)
                        .withDetail(rnf.getDetail())
                        .withType(rnf.getType())
                        .withInstance(rnf.getInstance())
                        .build()
                ,nativeWebRequest
        );
    }

    @ExceptionHandler(Exception.class)
    ResponseEntity<Problem> defaultHandler(Exception rnf, NativeWebRequest nativeWebRequest){
        return create(
                Problem.builder()
                        .withTitle(Status.INTERNAL_SERVER_ERROR.name())
                        .withStatus(Status.INTERNAL_SERVER_ERROR)
                        .withDetail(rnf.getMessage())
                        .build()
                ,nativeWebRequest
        );
    }

}