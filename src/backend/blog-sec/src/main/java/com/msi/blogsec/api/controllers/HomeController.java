package com.msi.blogsec.api.controllers;

import com.msi.blogsec.api.controllers.models.output.HomeModel;
import com.msi.blogsec.api.security.constants.Authorities;
import com.msi.blogsec.api.security.helpers.SecurityHelper;
import com.msi.blogsec.data.Post;
import com.msi.blogsec.domain.BlogServices;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : goliathhagar
 * @CreatedBy : IntelliJ IDEA
 * @ProjectName : blog-sec
 * @mailto : goliathhagar@outlook.com
 * @created : 3/21/23, Tuesday, 10:45 AM
 **/

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class HomeController {

    @GetMapping
    ResponseEntity<HomeModel> home(){
        return ResponseEntity.ok(new HomeModel());
    }

}
