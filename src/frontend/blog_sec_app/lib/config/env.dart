class Environment {
  static const String clientId = 'blog-app-service';
  static const String clientSecret = '54CSwjITKrJiTRdHzThkzEbdVtQWZTFX';
  static const String ssoUrl = 'localhost:9000/realms/blog-sec';
  static const String masterSsoUrl = 'localhost:9000/realms/master';
  static const String adminSsoUrl = 'localhost:9000/admin/realms/blog-sec';
  static const String openIdEndpoint = '/protocol/openid-connect';
  static const String tokenEndpoint = '/protocol/openid-connect/token';
  static const String authEndpoint = '/protocol/openid-connect/auth';
  static const String introspectEndpoint =
      '/protocol/openid-connect/introspect';
  static const String userInfoEndpoint = '/protocol/openid-connect/userinfo';
  static const String endSessionEndpoint = '/protocol/openid-connect/logout';
  static const String redirectEndpoint = '/login.html';
  static const String authUrl =
      "http://${ssoUrl + openIdEndpoint}/auth?client_id=$clientId"; // TODO: change to https
}
