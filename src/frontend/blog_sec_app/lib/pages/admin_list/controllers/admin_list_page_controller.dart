import 'package:blog_sec_app/config/endpoints.dart';
import 'package:blog_sec_app/controllers/admin_list_controller.dart';
import 'package:blog_sec_app/data/post.dart';
import 'package:blog_sec_app/data/post_list.dart';
import 'package:get/get.dart';

class AdmniListPageController extends GetxController {
  AdminLisController get controller => Get.put(AdminLisController());
  PostList get postList => controller.postList;
  
  getPostList() {
    controller.getPostList();
  }

  handleCreateNewPost() {
    Get.toNamed(Endpoints.publish);
  }

  handleEditPost(Post post) {}
}
