import 'package:flutter/widgets.dart';

class AppConfig {
  static const apiUrl = "http://localhost:8080/api";
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
