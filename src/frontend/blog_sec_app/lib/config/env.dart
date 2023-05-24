class Environment {
  static const String clientId = 'pay-resource-server-test';
  static const String clientSecret = 'ihsv6hvJdHVHMPoSLxLusuqKdEKZfo9F';
  //static const String clientSecret = 'pKwYed87cJSh9u0RQzyBUCO893djaj1X';
  //static const String ssoUrl = 'localhost:8180/realms/TryonPay';
  static const String ssoUrl = 'tryondev.ddns.net/auth/realms/TryonPay';
  //static const String masterSsoUrl = 'localhost:8180/realms/master';
  static const String masterSsoUrl = 'tryondev.ddns.net/auth/realms/master';
  //static const String adminSsoUrl = 'localhost:8180/admin/realms/TryonPay';
  static const String adminSsoUrl = 'tryondev.ddns.net/auth/admin/realms/TryonPay';
  static const String openIdEndpoint = '/protocol/openid-connect';
  static const String tokenEndpoint = '/protocol/openid-connect/token';
  static const String authEndpoint = '/protocol/openid-connect/auth';
  static const String introspectEndpoint = '/protocol/openid-connect/introspect';
  static const String userInfoEndpoint = '/protocol/openid-connect/userinfo';
  static const String endSessionEndpoint = '/protocol/openid-connect/logout';
  static const String redirectEndpoint = '/login.html';
  static const String authUrl =
      "https://${ssoUrl + openIdEndpoint}/auth?client_id=$clientId"; // TODO: change to https

  // ADMIN Endpoints
  static const String usersEndpoint = '/users';
  static const String eventsEndpoint = '/events';

  /*
  static const String adminName = 'admin';
  static const String adminPassword = 'password';
  */

  // static const String adminName = 'marcelo.monteiro@powersolutioncv.com';
  // static const String adminPassword = 'Try0nP@y#ADMIN';

  static const String adminName = 'power';
  static const String adminPassword = 'paypass';

  static const String adminClient = 'admin-cli';
}
