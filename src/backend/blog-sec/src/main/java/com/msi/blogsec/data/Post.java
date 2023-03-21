package com.msi.blogsec.data;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 3/21/23, Tuesday, 10:48 AM
 **/

@Entity
public class Post {
    @Id private String id;



    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }
}
