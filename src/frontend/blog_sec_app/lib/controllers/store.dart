import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStore extends GetxController {
  saveToLocalStorage(String key, String value) async {
    final userdata = await SharedPreferences.getInstance();
    userdata.setString(key, value);
  }

  loadFromLocalStorage(String key) async {
    final userdata = await SharedPreferences.getInstance();
    final id = userdata.getString(key);
    return id;
  }
}
