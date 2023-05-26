import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/post.dart';
import '../../../repositories/post_repository.dart';

class BlogDetailController extends GetxController {
  Post postDetail = Post();
  bool _loading = false;
  final _api = PostRepository();

  bool get loading => _loading;

  Future<void> getPostList(String postLink) async {
    _loading = true;

    try {
      postDetail = await _api.fetchOne(postLink);
    } catch (e) {
      if (int.parse(e.toString()) >= 400 || int.parse(e.toString()) < 500) {}

      log(e.toString());
    } finally {
      _loading = false;

      update();
    }
  }
}
