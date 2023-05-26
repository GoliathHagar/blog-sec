import 'package:blog_sec_app/controllers/store.dart';
import 'package:get/get.dart';

import '../pages/admin_list/controllers/admin_list_page_controller.dart';
import '../pages/publish/controllers/publish_page_controller.dart';
import 'auth_controller.dart';
import 'blog_detail_controller.dart';
import 'home_controller.dart';
import 'publish_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppStore(), permanent: true);
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BlogDetailController());
    Get.lazyPut(() => AdmniListPageController());
    Get.lazyPut(() => PublishController());
    Get.lazyPut(() => PublishPageController());
  }
}
