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
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['content'] = this.content;
    data['parentCommentId'] = this.parentCommentId;
    data['createdAt'] = this.createdAt;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class Links {
  Post? post;

  Links({this.post});

  Links.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

class Post {
  String? href;

  Post({this.href});

  Post.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
