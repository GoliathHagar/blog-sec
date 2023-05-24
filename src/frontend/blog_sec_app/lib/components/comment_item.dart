import 'package:flutter/material.dart';

import '../data/comment.dart';

class PostItem extends StatelessWidget {
  final Comment comment;

  const PostItem({required this.comment, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(comment.user!),
          Text(comment.content!),
          Text(comment.createdAt!)
        ],
      ),
    );
  }
}
