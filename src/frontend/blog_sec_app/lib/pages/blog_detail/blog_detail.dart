import 'package:blog_sec_app/components/post_details.dart';
import 'package:blog_sec_app/data/comment.dart';
import 'package:blog_sec_app/data/post.dart';
import 'package:flutter/material.dart';

import '../../components/comment_item.dart';

class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key, this.post});
  final Post? post;
  List<Comment> get comments => [Comment()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          PostDetails(post: post ?? Post()),
          Column(
            children:
                comments.map((e) => CommentItem(comment: e)).toList() ?? [],
          )
        ],
      )),
    );
  }
}
