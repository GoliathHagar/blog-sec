import 'package:blog_sec_app/data/post.dart';

class PostList {
  Embedded? eEmbedded;
  Links? lLinks;
  Page? page;

  PostList({this.eEmbedded, this.lLinks, this.page});

  PostList.fromJson(Map<String, dynamic> json) {
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
  List<Post>? postOutputModelList;

  Embedded({this.postOutputModelList});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['postOutputModelList'] != null) {
      postOutputModelList = <Post>[];
      json['postOutputModelList'].forEach((v) {
        postOutputModelList!.add(Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (postOutputModelList != null) {
      data['postOutputModelList'] =
          postOutputModelList!.map((v) => v.toJson()).toList();
    }
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
