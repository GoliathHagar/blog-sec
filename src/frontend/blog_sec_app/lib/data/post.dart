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
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['content'] = this.content;
    data['status'] = this.status;
    data['commentAllowed'] = this.commentAllowed;
    data['tags'] = this.tags;
    data['publishedAt'] = this.publishedAt;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class Links {
  Self? self;
  Self? comments;

  Links({this.self, this.comments});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    comments =
    json['comments'] != null ? new Self.fromJson(json['comments']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}