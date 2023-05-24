import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:universal_html/html.dart' as html;

class AuthHandler {
  String clientId;
  String clientSecret;
  String redirectUrl;
  String issuer;
  List<String> scopes;

  String idToken = "";
  String accessToken = "";
  String refreshToken = "";
  String audience = "";
  Map<String, dynamic>? userDetails;

  AuthHandler({
    required this.clientId,
    required this.clientSecret,
    required this.issuer,
    required this.redirectUrl,
    required this.scopes,
    required this.audience,
  });

  Map<String, dynamic> getTokenPayload(token) {
    if (token.isNotEmpty) {
      return Jwt.parseJwt(token);
    }
    return {};
  }

  Future<Map> getUserDetails(String accessToken) async {
    final url = "https://$issuer/userinfo";
    final response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to get user details");
    }
  }

  static randomString(length) {
    var charset = "0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz+/";
    var result = "";

    while (length > 0) {
      var bytes = Uint8List(16);
      var random = html.window.crypto!.getRandomValues(bytes) as List;
      for (var c in random) {
        if (length == 0) {
          continue;
        }
        if (c < charset.length) {
          result += charset[c];
          length--;
        }
      }
    }
    return result;
  }
}
