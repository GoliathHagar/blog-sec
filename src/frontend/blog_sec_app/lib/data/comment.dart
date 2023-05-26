class Comment {
  String? user;
  String? content;
  String? parentCommentId;
  String? createdAt;
  Links? lLinks;

  Comment(
      {this.user,
      this.content,
      this.parentCommentId,
      this.createdAt,
      this.lLinks});

  Comment.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    content = json['content'];
    parentCommentId = json['parentCommentId'];
    createdAt = json['createdAt'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['content'] = content;
    data['parentCommentId'] = parentCommentId;
    data['createdAt'] = createdAt;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class Links {
  PostLink? post;

  Links({this.post});

  Links.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? PostLink.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (post != null) {
      data['post'] = post!.toJson();
    }
    return data;
  }
}

class PostLink {
  String? href;

  PostLink({this.href});

  PostLink.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}
