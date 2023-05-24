import 'package:blog_sec_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/post_item.dart';
import '../../data/post_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController get homeController => Get.put(HomeController());
  PostList get postList => homeController.postList;

  @override
  void initState() {
    homeController.getPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: postList.eEmbedded?.postOutputModelList
                ?.map((e) => PostItem(post: e))
                .toList() ??
            [],
      ),
    );
  }
}
