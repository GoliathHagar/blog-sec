import 'package:flutter/material.dart';

import '../data/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({required this.comment, Key? key}) : super(key: key);

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
