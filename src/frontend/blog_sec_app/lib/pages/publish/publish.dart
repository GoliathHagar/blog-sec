import 'package:blog_sec_app/controllers/publish_controller.dart';
import 'package:blog_sec_app/pages/publish/controllers/publish_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/post.dart';

class Publish extends StatefulWidget {
  const Publish({super.key, this.post});
  final Post? post;

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  PublishPageController get pageController => Get.put(PublishPageController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageController.formKey = _formKey;
    if (widget.post?.lLinks != null) {
      pageController.initFields(widget.post!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(32),
          child: GetBuilder<PublishController>(builder: (pubcontroller) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Post",
                      style: TextStyle(fontSize: 32),
                    ),
                    pageController.canPublish()
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {},
                            child: const Text("Publish"))
                        : const SizedBox()
                  ],
                ),
                const SizedBox(height: 24),
                Form(
                    key: pageController.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: pageController.blogTitleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            labelText: 'Blog title',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          controller: pageController.blogContentController,
                          decoration: const InputDecoration(
                            labelText: 'Blog Content',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          maxLength: 200,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: pageController.handleSavePost,
                                child: const Text("Save")),
                          ],
                        )
                      ],
                    ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
