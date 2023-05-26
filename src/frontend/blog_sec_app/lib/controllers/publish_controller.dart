import 'dart:developer';

import 'package:get/get.dart';

import '../data/post.dart';
import '../repositories/post_repository.dart';

class PublishController extends GetxController {
  Post createdPost = Post();
  final _api = PostRepository();

  bool _loading = false;

  bool get loading => _loading;
  Future<void> create(Post post) async {
    _loading = true;

    try {
      createdPost = await _api.create(post);
    } catch (e) {
      log(e.toString());
    } finally {
      _loading = false;

      update();
    }
  }
}
