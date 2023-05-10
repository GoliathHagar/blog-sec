package com.msi.blogsec.api.controllers.models.output;

import com.msi.blogsec.api.controllers.CommentController;
import com.msi.blogsec.api.controllers.PostController;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import com.msi.blogsec.api.controllers.HomeController;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 5/10/23, Wednesday, 6:52 PM
 **/
public class HomeModel extends RepresentationModel<HomeModel> {
    private final String motd;

    public HomeModel() {
        this.motd = "Welcome to BlogSec API endpoint!!";
        this.add(WebMvcLinkBuilder.linkTo(HomeController.class).withSelfRel());
        this.add(WebMvcLinkBuilder.linkTo(PostController.class).withRel("posts"));
        this.add(WebMvcLinkBuilder.linkTo(CommentController.class).withRel("comments"));
    }

    public String getMotd() {
        return motd;
    }
}