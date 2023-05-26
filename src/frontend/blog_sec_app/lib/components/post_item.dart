import 'package:blog_sec_app/components/app_button.dart';
import 'package:flutter/material.dart';

import '../data/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final void Function()? editAction;
  const PostItem({required this.post, Key? key, this.editAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [Text(post.author!), Text(post.title!), _buildEditButton()],
      ),
    );
  }

  _buildEditButton() {
    if (editAction != null) {
      return AppButton(
        label: "Edit",
        onpress: editAction,
      );
    }

    return const SizedBox();
  }
}
