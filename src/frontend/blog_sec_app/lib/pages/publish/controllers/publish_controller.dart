import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/post.dart';

class PublishController extends GetxController {
  GlobalKey<FormState>? formKey;
  late TextEditingController blogTitleController;

  late TextEditingController blogContentController;

  @override
  void onInit() {
    blogTitleController = TextEditingController();
    blogContentController = TextEditingController();
    super.onInit();
  }

  void initFields(Post? post) {
    blogTitleController.text = post?.title ?? "";
    blogContentController.text = post?.content ?? "";
  }

  void handleSavePost() {}
}
