class CommentList {
  Embedded? eEmbedded;
  Links? lLinks;
  Page? page;

  CommentList({this.eEmbedded, this.lLinks, this.page});

  CommentList.fromJson(Map<String, dynamic> json) {
    eEmbedded =
        json['_embedded'] != null ? Embedded.fromJson(json['_embedded']) : null;
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
    page = json['page'] != null ? Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eEmbedded != null) {
      data['_embedded'] = eEmbedded!.toJson();
    }
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    if (page != null) {
      data['page'] = page!.toJson();
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
        commentOutputModelList!.add(CommentOutputModelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (commentOutputModelList != null) {
      data['commentOutputModelList'] =
          commentOutputModelList!.map((v) => v.toJson()).toList();
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
  Post? post;

  Links({this.post});

  Links.fromJson(Map<String, dynamic> json) {
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (post != null) {
      data['post'] = post!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    data['number'] = number;
    return data;
  }
}
