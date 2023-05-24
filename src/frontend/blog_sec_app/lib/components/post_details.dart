
import 'package:blog_sec_app/data/post.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final Post post;

  const PostDetails({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(post.title!), Text(post.content!), Text(post.createdAt!)],);
  }
}
