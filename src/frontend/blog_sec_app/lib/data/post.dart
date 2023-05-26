class Post {
  String? author;
  String? title;
  String? content;
  String? status;
  bool? commentAllowed;
  String? tags;
  String? publishedAt;
  String? updatedAt;
  String? createdAt;
  Links? lLinks;

  Post(
      {this.author,
      this.title,
      this.content,
      this.status,
      this.commentAllowed,
      this.tags,
      this.publishedAt,
      this.updatedAt,
      this.createdAt,
      this.lLinks});

  Post.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    content = json['content'];
    status = json['status'];
    commentAllowed = json['commentAllowed'];
    tags = json['tags'];
    publishedAt = json['publishedAt'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['title'] = title;
    data['content'] = content;
    data['status'] = status ?? "DRAFT";
    data['commentAllowed'] = commentAllowed;
    data['tags'] = tags ?? "DRAFT";
    data['publishedAt'] = publishedAt;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;

    return data;
  }
}

class Links {
  Self? self;
  Self? comments;

  Links({this.self, this.comments});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
    comments =
        json['comments'] != null ? Self.fromJson(json['comments']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.toJson();
    }
    if (comments != null) {
      data['comments'] = comments!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}
