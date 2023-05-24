// ignore_for_file: non_constant_identifier_names

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;

import '../config/env.dart';
import '../helpers/app_text.dart';
import '../helpers/auth.dart';
import '../helpers/default_values.dart';

final _appBaseUrl = html.window.location.href;
final _KEYCLOAK_REDIRECT_URI = _appBaseUrl;

const _clientId = Environment.clientId;
const _clientSecret = Environment.clientSecret;
const _domain = Environment.ssoUrl + Environment.openIdEndpoint;
const _audience = Environment.clientId;

final String _redirectUrl =
    "${Uri.parse(_KEYCLOAK_REDIRECT_URI).origin}/login.html";
const List<String> _scopes = ["openid"];

class AuthController extends GetxController {
  String _errorMessage = "";
  String _authId = "";
  String _fullName = "";
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _birthdate = "";
  String _idToken = "";
  String _accessToken = "";

  DateTime? _expireTime;

  bool _emailVerified = true;
  bool _isLoggedIn = false;
  bool _loading = false;

  String get errorMessage => _errorMessage;
  String get authId => _authId;
  String get fullName => _fullName;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get birthdate => _birthdate;
  String get idToken => _idToken;
  String get accessToken => _accessToken;

  DateTime? get expireTime => _expireTime;

  bool get emailVerified => _emailVerified;
  bool get isLoggedIn => _isLoggedIn;
  bool get loading => _loading;

  html.WindowBase? _popupWin;

  late AuthHandler _authHandler;
  @override
  void onInit() {
    _authHandler = AuthHandler(
      clientId: _clientId,
      clientSecret: _clientSecret,
      issuer: _domain,
      redirectUrl: _redirectUrl,
      scopes: _scopes,
      audience: _audience,
    );
    init();
    super.onInit();
  }

  void init() async {
    _loading = true;

    final userDataStorage = await SharedPreferences.getInstance();

    if (userDataStorage.containsKey("idToken") ||
        userDataStorage.containsKey("accessToken")) {
      debugPrint("Data storage contains idToken already");
      getDataFromLocalStorage(userDataStorage);

      _isLoggedIn = true;
      _loading = false;

      update();
    }
  }

  void signIn() async {
    final userDataStorage = await SharedPreferences.getInstance();

    debugPrint("ID token in sign in: $idToken");
    debugPrint("accessToken : $accessToken");
    debugPrint("expireTime : $expireTime");
    debugPrint("emailVerified : $emailVerified");

    if (userDataStorage.containsKey("idToken")) {
      debugPrint("Got inside user data storage");

      getDataFromLocalStorage(userDataStorage);
      _isLoggedIn = true;

      update();

      return;
    }

    final _nonce = AuthHandler.randomString(16);

    var url = "https://$_domain/auth"
        "?client_id=$_clientId"
        // "&response_type=id_token token"
        "&response_type=code"
        "&audience=$_audience"
        "&redirect_uri=$_redirectUrl"
        "&scope=openid" //${scopes.fold("", (prev, element) => "$prev $element")}"
        "&nonce=$_nonce"
        "&prompt=login";

    if (_popupWin == null) {
      debugPrint("On opening: popWin = null");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _popupWin =
            html.window.open(url, AppText.authWindowTitle, "scrollbars=yes");
      });
    } else {
      debugPrint("On opening: popWin != null");
      _popupWin = html.window.open(
          url,
          AppText.authWindowTitle,
          "width=${DefaultValues.authPopUpWidth}, "
          "height=${DefaultValues.authPopUpHeight}, "
          "scrollbars=yes");
    }

    update();
  }

  void listenLoginEvent(event) async {
    final _nonce = AuthHandler.randomString(16);

    debugPrint("ID token listtening: $idToken");
    debugPrint("accessToken : $accessToken");
    debugPrint("expireTime : $expireTime");
    debugPrint("emailVerified : $emailVerified");

    // The event contains the code then use it to request acesstoken and id token.
    if ((event as html.MessageEvent).data.toString().contains('code=')) {
      debugPrint("Contains code=");

      if (_popupWin == null) {
        debugPrint("popWin is null");
        debugPrint("ID token in popwin null: $idToken");
        debugPrint("accessToken : $accessToken");
        debugPrint("expireTime : $expireTime");
        debugPrint("emailVerified : $emailVerified");
        return;
      }

      debugPrint("ID token in login event: $idToken");
      debugPrint("accessToken : $accessToken");
      debugPrint("expireTime : $expireTime");
      debugPrint("emailVerified : $emailVerified");

      _popupWin!.close();
      _popupWin = null;

      // get code grant
      final _receivedUri = Uri.parse(event.data);
      final _code = _receivedUri.queryParameters["code"];

      debugPrint("Code = $_code");
      debugPrint("ID token to get code: $idToken");
      debugPrint("accessToken : $accessToken");
      debugPrint("expireTime : $expireTime");
      debugPrint("emailVerified : $emailVerified");

      // request tokens
      var _headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      var _request = http.Request('POST', Uri.parse("https://$_domain/token"));

      _request.bodyFields = {
        "grant_type": "authorization_code",
        "code": "$_code",
        "client_id": _clientId,
        "client_secret": _clientSecret,
        "redirect_uri": _redirectUrl,
        "state": "$_nonce"
      };

      debugPrint("ID token before token: $idToken");
      debugPrint("accessToken : $accessToken");
      debugPrint("expireTime : $expireTime");
      debugPrint("emailVerified : $emailVerified");

      _request.headers.addAll(_headers);
      var response = await _request.send();

      //debugPrint("Response : ${jsonDecode(await response.stream.bytesToString())}");

      if (response.statusCode == 200) {
        final tokens = jsonDecode(await response.stream.bytesToString());
        _idToken = tokens["id_token"];
        _accessToken = tokens["access_token"];
        _expireTime =
            DateTime.now().add(Duration(seconds: tokens["expires_in"]));
        _emailVerified =
            _authHandler.getTokenPayload(idToken)["email_verified"];

        debugPrint("ID token after token req: $idToken");
        debugPrint("accessToken : $accessToken");
        debugPrint("expireTime : $expireTime");
        debugPrint("emailVerified : $emailVerified");

        getUserData();

        _isLoggedIn = true;
      } else {}

      _loading = false;
      update();
    }

    debugPrint('Doesnt contain code=');
    debugPrint("ID token withou code: $idToken");
    debugPrint("accessToken : $accessToken");
    debugPrint("expireTime : $expireTime");
    debugPrint("emailVerified : $emailVerified");
  }

  void getUserData() async {
    final _userDataStorage = await SharedPreferences.getInstance();
    _loading = true;

    debugPrint("ID token getting user data: $idToken");
    debugPrint("accessToken : $accessToken");
    debugPrint("expireTime : $expireTime");
    debugPrint("emailVerified : $emailVerified");

    if (_userDataStorage.containsKey("sub")) {
      debugPrint("Contains field 'sub'");

      getDataFromLocalStorage(_userDataStorage);

      _isLoggedIn = true;
      _loading = false;

      update();

      return;
    }

    debugPrint("Doesn't contain string 'sub'");

    //Map<String, dynamic> _accessTokenPayload = _authHandler.getTokenPayload(accessToken);
    Map<String, dynamic> _idTokenPayload =
        _authHandler.getTokenPayload(idToken);

    debugPrint("Token Payload : $_idTokenPayload");

    _authId = _idTokenPayload["sub"];
    _email = _idTokenPayload["preferred_username"];
    _fullName = _idTokenPayload["name"];
    _firstName = _idTokenPayload["given_name"];
    _lastName = _idTokenPayload["family_name"];
    _birthdate = _idTokenPayload["DOB"] ?? "";
    _email = _idTokenPayload["email"] ?? "";

    setDataToLocalStorage(_userDataStorage);
  }

  void getDataFromLocalStorage(SharedPreferences userDataStorage) async {
    _authId = userDataStorage.getString("authId") as String;
    _email = userDataStorage.getString("username") as String;
    _fullName = userDataStorage.getString("fullName") as String;
    _firstName = userDataStorage.getString("firstName") as String;
    _lastName = userDataStorage.getString("lastName") as String;
    _birthdate = userDataStorage.getString("birthdate") as String;
    _idToken = userDataStorage.getString("idToken") as String;
    _accessToken = userDataStorage.getString("accessToken") as String;

    if (userDataStorage.containsKey("expireTime")) {
      var _expireTimeStr = userDataStorage.getString("expireTime");
      _expireTime = DateTime.parse(_expireTimeStr as String);
    }
  }

  void setDataToLocalStorage(SharedPreferences userDataStorage) async {
    userDataStorage.setString("authId", authId);
    userDataStorage.setString("username", email);
    userDataStorage.setString("fullName", fullName);
    userDataStorage.setString("firstName", firstName);
    userDataStorage.setString("lastName", lastName);
    userDataStorage.setString("birthdate", birthdate);
    userDataStorage.setString("idToken", idToken);
    userDataStorage.setString("accessToken", accessToken);
    userDataStorage.setString("expireTime", expireTime.toString());
    // userDataStorage.setBool("first_login", firstLogin);
  }

  bool isValidTokenExpiration() {
    if (expireTime == null) {
      return false;
    }
    bool _isValid = DateTime.now().isBefore(expireTime as DateTime);
    return _isValid;
  }

  signOut() async {
    final _userDataStorage = await SharedPreferences.getInstance();

    _loading = true;
    // logout();
    _accessToken = "";
    _idToken = "";
    _userDataStorage.clear();

    var url = "https://$_domain/logout";
    //"?client_id=$clientId"
    //"&post_logout_redirect_uri=$redirectUrl";

    if (_popupWin == null) {
      debugPrint("Logout opening: popWin = null");

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _popupWin =
            html.window.open(url, AppText.logoutWindowTitle, "scrollbars=yes");
      });
    } else {
      debugPrint("Logout opening: popWin != null");
      _popupWin = html.window.open(
          url,
          AppText.logoutWindowTitle,
          "width=${DefaultValues.authPopUpWidth}, "
          "height=${DefaultValues.authPopUpHeight}, "
          "scrollbars=yes");
    }

    _isLoggedIn = false;

    html.window.location.replace('/'); // TODO: replace with endpoint

    _loading = false;
    update();
  }

  Future<Map> getUserDetails(String accessToken) async {
    const _url = "https://$_domain/userinfo";

    try {
      http.Response _response = await http.get(
        Uri.parse(_url),
        headers: {"Authorization": "Bearer $accessToken"},
      );

      if (_response.statusCode == 200) {
        debugPrint("USER INFO: ${_response.body}");
        return jsonDecode(_response.body);
      } else {
        _errorMessage = "Failed to get user details";
        throw Exception(
            "Failed to get user details: Code: ${_response.statusCode} Phrase: ${_response.reasonPhrase}");
      }
    } catch (e, s) {
      _errorMessage = "Failed to get user details: $e";
      throw Exception("Error: $e \n Stack: $s");
    }
  }
}
