import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppConfig {
  static const apiUrl = "http://localhost:8080";
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
