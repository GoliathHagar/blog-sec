import 'package:blog_sec_app/components/app_button.dart';
import 'package:blog_sec_app/components/post_item.dart';
import 'package:blog_sec_app/data/post_list.dart';
import 'package:blog_sec_app/pages/admin_list/controllers/admin_list_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/post.dart';

class AdminList extends StatelessWidget {
  const AdminList({super.key});
  AdmniListPageController get pageController =>
      Get.put(AdmniListPageController());

  PostList get postList => pageController.postList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Build Beautiful Post",
                  style: TextStyle(fontSize: 32),
                ),
                AppButton(
                  label: "New Post",
                  onpress: pageController.handleCreateNewPost,
                )
              ],
            ),
            Column(
                children:
                    _buildPostList(postList?.eEmbedded?.postOutputModelList))
          ],
        ),
      )),
    );
  }

  List<Widget> _buildPostList(List<Post>? posts) {
    if (posts == null) {
      return [];
    }
    return posts
        .map(
          (post) => PostItem(
            post: post,
            editAction: () => pageController.handleEditPost(post),
          ),
        )
        .toList();
  }
}
