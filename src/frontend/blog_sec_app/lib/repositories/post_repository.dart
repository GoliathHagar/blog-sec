import 'dart:convert';
import 'package:blog_sec_app/data/post.dart';
import 'package:blog_sec_app/data/post_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_config.dart';

class PostRepository {
  static const String _connectionString = "${AppConfig.apiUrl}/post";
  Uri uri = Uri.parse(_connectionString);

  final Map<String, String> getHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };
  final Map<String, String> postHeaders = {};

  static final PostRepository _api = PostRepository._instance();

  Future<Map<String, String>> authHeader() async {
    final userdata = await SharedPreferences.getInstance();
    String? accessToken = userdata.getString("accessToken");

    return {'Authorization': 'Bearer $accessToken'};
  }

  factory PostRepository() {
    return _api;
  }

  PostRepository._instance();

  @override
  Future<Post> create(Post post) async {
    Post postResult;
    Uri uri = Uri.parse(_connectionString);
    postHeaders.addAll(await authHeader());
    postHeaders.addAll({"Access-Control_Allow_Origin": "*"});
    try {
      final postBody = post.toJson();

      print(postBody);
      print(postHeaders);
      final response = await http.post(
        uri,
        body: jsonEncode(postBody),
        headers: postHeaders,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        postResult = Post.fromJson(jsonDecode(response.body));
        debugPrint('Success: ${response.body}\n');
      } else {
        throw Exception(
            'Waring: Failed to create new Post | H: ${response.headers} | B: ${response.body} | CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Error: Failed to create new Post | $e');
    }

    return postResult;
  }

  @override
  Future<Post> updateAccount(Post post) async {
    Post postResult;
    Uri updateUri;
    final userdata = await SharedPreferences.getInstance();
    String? accessToken = userdata.getString("accessToken");
    postHeaders.addAll({'Authorization': 'Bearer $accessToken'});
    updateUri = Uri.parse(post.lLinks?.self?.href ?? "");

    try {
      final response = await http.put(
        updateUri,
        body: post.toJson(),
        headers: postHeaders,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        postResult = Post.fromJson(jsonDecode(response.body));
        // debugPrint('Success: ${offerResponse.toJson()}');
      } else {
        throw Exception('${jsonDecode(response.body)["title"]}');
      }
    } catch (e) {
      throw Exception('$e');
    }

    return postResult;
  }

  @override
  Future<Post> fetchOne(String postLink) async {
    Post post;
    final userdata = await SharedPreferences.getInstance();
    String? accessToken = userdata.getString("accessToken");
    getHeaders.addAll({'Authorization': 'Bearer $accessToken'});

    final response = await http.get(Uri.parse(postLink), headers: getHeaders);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint("\n\nACCOUNT: ${response.body}");
      post = Post.fromJson(jsonDecode(response.body));
    } else {
      return Future.error(response.statusCode);
    }

    return post;
  }

  @override
  Future<Post> fetchSelf() async {
    Post post;
    final userdata = await SharedPreferences.getInstance();
    String? accessToken = userdata.getString("accessToken");
    getHeaders.addAll({'Authorization': 'Bearer $accessToken'});

    final response = await http.get(uri, headers: getHeaders);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint("\n\nACCOUNT SELF: ${response.body}");
      post = Post.fromJson(jsonDecode(response.body));
    } else {
      debugPrint("\n\n${response.body} # ${response.statusCode}");
      return Future.error(response.statusCode);
    }

    return post;
  }

  @override
  Future<PostList> fetchList() async {
    PostList accounts;
    final Uri listUri = Uri.parse(_connectionString);
    try {
      final response = await http.get(listUri, headers: getHeaders);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        debugPrint("\n\n${response.body}");

        accounts = PostList.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Waring: Failed to load data from api | ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error: Failed to load data from api | $e');
    }

    return accounts;
  }

  @override
  Future<PostList> fetchListPageable(int page, int size) async {
    PostList postList;
    final Uri pageableUri =
        Uri.parse("$_connectionString?page=$page&size=$size");

    try {
      final response = await http.get(pageableUri, headers: getHeaders);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        postList = PostList.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Waring: Failed to load data from api | ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error: Failed to load data from api | $e');
    }

    return postList;
  }

  Future<void> loadGetAuthHeaders() async {
    final userdata = await SharedPreferences.getInstance();
    String? accessToken = userdata.getString("accessToken");
    getHeaders.addAll({'Authorization': 'Bearer $accessToken'});
  }
}
