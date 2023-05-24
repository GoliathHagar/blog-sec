class CommentList {
  Embedded? eEmbedded;
  Links? lLinks;
  Page? page;

  CommentList({this.eEmbedded, this.lLinks, this.page});

  CommentList.fromJson(Map<String, dynamic> json) {
    eEmbedded = json['_embedded'] != null
        ? new Embedded.fromJson(json['_embedded'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eEmbedded != null) {
      data['_embedded'] = this.eEmbedded!.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    return data;
  }
}

class Embedded {
  List<CommentOutputModelList>? commentOutputModelList;

  Embedded({this.commentOutputModelList});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['commentOutputModelList'] != null) {
      commentOutputModelList = <CommentOutputModelList>[];
      json['commentOutputModelList'].forEach((v) {
        commentOutputModelList!.add(new CommentOutputModelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commentOutputModelList != null) {
      data['commentOutputModelList'] =
          this.commentOutputModelList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommentOutputModelList {
  String? user;
  String? content;
  String? parentCommentId;
  String? createdAt;
  Links? lLinks;

  CommentOutputModelList(
      {this.user,
        this.content,
        this.parentCommentId,
        this.createdAt,
        this.lLinks});

  CommentOutputModelList.fromJson(Map<String, dynamic> json) {
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

class Links {
  Post? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Post.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    return data;
  }
}

class Page {
  int? size;
  int? totalElements;
  int? totalPages;
  int? number;

  Page({this.size, this.totalElements, this.totalPages, this.number});

  Page.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    data['number'] = this.number;
    return data;
  }
}
