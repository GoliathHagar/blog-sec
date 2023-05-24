import 'package:flutter/material.dart';

import '../data/post.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(child: Row(children: [ Text(post.author!), Text(post.title!)],),);
  }
}
