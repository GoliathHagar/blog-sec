import 'package:blog_sec_app/controllers/store.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'home_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppStore(), permanent: true);
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
  }
}
