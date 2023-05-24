package com.msi.blogsec.domain;

import com.msi.blogsec.data.Author;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.domain.models.PostSearchParams;
import jakarta.persistence.criteria.*;
import lombok.AllArgsConstructor;
import org.springframework.data.jpa.domain.Specification;

import java.util.ArrayList;
import java.util.List;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/13/23, Saturday, 2:00 PM
 **/

@AllArgsConstructor
public class PostSearchSpecificator implements Specification<Post> {
    transient PostSearchParams params;

    @Override
    public Predicate toPredicate(Root<Post> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
        Join<Post, Author> author = root.join("author", JoinType.INNER);

        List<Predicate> predicates = new ArrayList<>();

        if(params.getOwner() != null && !params.getOwner().isEmpty() )
            predicates.add(
                    criteriaBuilder.equal(
                            criteriaBuilder.lower(author.get("jwtUserId")),
                            params.getOwner().toLowerCase()
                    )
            );

        else if (params.getStatus() != null)
            predicates.add(
                    criteriaBuilder.equal(
                            root.get("status"), params.getStatus()
                    )
            );

        return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
    }
}
