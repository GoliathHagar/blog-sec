import 'package:blog_sec_app/components/app_loading.dart';
import 'package:blog_sec_app/controllers/publish_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/post.dart';

class PublishPageController extends GetxController {
  GlobalKey<FormState>? formKey;
  late TextEditingController blogTitleController;
  late TextEditingController blogContentController;

  PublishController get controller => Get.put(PublishController());

  Post get currentPost => controller.createdPost;
  @override
  void onInit() {
    blogTitleController = TextEditingController();
    blogContentController = TextEditingController();
    super.onInit();
  }

  void initFields(Post post) {
    blogTitleController.text = post.title ?? "";
    blogContentController.text = post.content ?? "";
    controller.createdPost = post;
  }

  Future<void> handleSavePost() async {
    Get.dialog(AppLoading());
    Post newPost = Post(
        title: blogTitleController.text, content: blogContentController.text);
    await controller.create(newPost);
    Get.back();
  }

  bool canPublish() {
    return currentPost.lLinks?.self != null;
  }
}
