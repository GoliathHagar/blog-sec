import 'package:blog_sec_app/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/app_routes.dart';
import 'controllers/controller_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blog Sec App',
      routes: AppRoutes.list,
      initialBinding: AppBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
