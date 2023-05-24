import 'package:blog_sec_app/pages/blog_detail/blog_detail.dart';
import 'package:blog_sec_app/pages/home/home.dart';
import 'package:blog_sec_app/pages/publish/publish.dart';

import 'package:flutter/material.dart';

import '../pages/admin_list/admin_list.dart';

import 'endpoints.dart';

class AppRoutes {
  static Map<String, Widget Function(dynamic _)> list = {
    Endpoints.home: (_) => const Home(),
    Endpoints.post: (_) => const BlogDetail(),
    Endpoints.postList: (_) => const AdminList(),
    Endpoints.publish: (_) => const Publish(),
  };
}
