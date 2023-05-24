import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PostRepository {
  static const String _connectionString = "${AppConfig.apiUrl}/account";
  Uri uri = Uri.parse(_connectionString);

  final Map<String, String> getHeaders = {"Accept": "application/json"};
  final Map<String, String> postHeaders = {'Content-Type': 'application/json'};

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
  Future<Account> registerAccount(Account account) async {
    Account accountResponse;
    Uri uri = Uri.parse(_connectionString);
    postHeaders.addAll(await authHeader());
    postHeaders.addAll({"Access-Control_Allow_Origin": "*"});
    try {
      account.links = {};

      final postBody = jsonEncode(<String, dynamic>{
        "authId": account.authId,
        "role": account.role,
        "firstName": account.firstName,
        "middleName": account.middleName,
        "lastName": account.lastName,
        "birthDate": account.birthDate,
        "merchantType": account.merchantType,
        "email": account.email,
        "phone": account.phone,
        "gender": account.gender,
        "addressLine": account.addressLine,
        "city": account.city,
        "cityOfBirth": account.cityOfBirth,
        "island": account.island,
        "country": account.country,
        "countryOfBirth": account.countryOfBirth,
        "nationalId": account.nationalId,
        "postalCode": account.postalCode,
        "currencyCode": account.currencyCode,
      }); //account.toJson();

      final response = await http.post(
        uri,
        body: postBody,
        headers: postHeaders,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        accountResponse = Account.fromJson(jsonDecode(response.body));
        debugPrint('Success: ${response.body}\n');
      } else {
        throw Exception(
            'Waring: Failed to create new Account | H: ${response.headers} | B: ${response.body} | CODE: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: Failed to create new Account | $e');
    }

    return accountResponse;
  }

  @override
  Future<Account> updateAccount(Account account) async {
    Account accountResponse;
    Uri updateUri;
    final userdata = await SharedPreferences.getInstance();
    String? accessToken = userdata.getString("accessToken");
    postHeaders.addAll({'Authorization': 'Bearer $accessToken'});
    updateUri = Uri.parse(account.links?["self"]["href"]);

    try {
      final response = await http.put(
        updateUri,
        body: account.toJson(),
        headers: postHeaders,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        accountResponse = Account.fromJson(jsonDecode(response.body));
        // debugPrint('Success: ${offerResponse.toJson()}');
      } else {
        throw Exception('${jsonDecode(response.body)["title"]}');
      }
    } catch (e) {
      throw Exception('$e');
    }

    return accountResponse;
  }

  @override
  Future<Account> fetchOne(String accountRelLink) async {
    Account account;
    final userdata = await SharedPreferences.getInstance();
    String? accessToken = userdata.getString("accessToken");
    getHeaders.addAll({'Authorization': 'Bearer $accessToken'});

    final response = await http.get(Uri.parse(accountRelLink), headers: getHeaders);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint("\n\nACCOUNT: ${response.body}");
      account = Account.fromJson(jsonDecode(response.body));
    } else {
      return Future.error(response.statusCode);
    }

    return account;
  }

  @override
  Future<Account> fetchSelf() async {
    Account account;
    final userdata = await SharedPreferences.getInstance();
    String? accessToken = userdata.getString("accessToken");
    getHeaders.addAll({'Authorization': 'Bearer $accessToken'});

    final response = await http.get(uri, headers: getHeaders);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint("\n\nACCOUNT SELF: ${response.body}");
      account = Account.fromJson(jsonDecode(response.body));
    } else {
      debugPrint("\n\n${response.body} # ${response.statusCode}");
      return Future.error(response.statusCode);
    }

    return account;
  }

  @override
  Future<Accounts> fetchList() async {
    Accounts accounts;
    final Uri listUri = Uri.parse("$_connectionString/all");
    try {
      final response = await http.get(listUri, headers: getHeaders);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        debugPrint("\n\n${response.body}");

        accounts = Accounts.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Waring: Failed to load data from api | ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error: Failed to load data from api | $e');
    }

    return accounts;
  }

  @override
  Future<Accounts> fetchListPageable(int page, int size) async {
    Accounts accounts;
    final Uri pageableUri = Uri.parse("$_connectionString?page=$page&size=$size");

    try {
      final response = await http.get(pageableUri, headers: getHeaders);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        accounts = Accounts.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Waring: Failed to load data from api | ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error: Failed to load data from api | $e');
    }

    return accounts;
  }

  @override
  Future<Accounts> fetchListByEmail(String email) async {
    Accounts accounts;
    final Uri listUri = Uri.parse("$_connectionString/all?email=$email&unpaged=true");
    try {
      await loadGetAuthHeaders();
      final response = await http.get(listUri, headers: getHeaders);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        debugPrint("\n\n${response.body}");

        accounts = Accounts.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Waring: Failed to load data from api | ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error: Failed to load data from api | $e');
    }
    return accounts;
  }

  Future<void> loadGetAuthHeaders() async {
    final userdata = await SharedPreferences.getInstance();
    String? accessToken = userdata.getString("accessToken");
    getHeaders.addAll({'Authorization': 'Bearer $accessToken'});
  }
}
