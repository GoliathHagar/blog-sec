import 'dart:developer';

import 'package:blog_sec_app/data/post_list.dart';
import 'package:get/get.dart';

import '../repositories/post_repository.dart';

class HomeController extends GetxController {
  PostList postList = PostList();
  final _api = PostRepository();
  bool _loading = false;

  bool get loading => _loading;

  getPostList(postLink) async {
    _loading = true;

    try {
      postList = await _api.fetchList();
    } catch (e) {
      if (int.parse(e.toString()) >= 400 || int.parse(e.toString()) < 500) {}

      log(e.toString());
    } finally {
      _loading = false;

      update();
    }
  }
}
