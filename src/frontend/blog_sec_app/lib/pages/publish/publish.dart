import 'package:blog_sec_app/pages/publish/controllers/publish_controller.dart';
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
  PublishController get pageController => Get.put(PublishController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageController.formKey = _formKey;
    pageController.initFields(widget.post);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Post",
                  style: TextStyle(fontSize: 32),
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    child: const Text("Publish"))
              ],
            ),
            const SizedBox(height: 24),
            Form(
                key: pageController.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: pageController.blogTitleController,
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
        ),
      ),
    );
  }
}
