class Strings {
  static final home = HomeStrings();
  static final login = LoginStrings();
  static final error = ErrorStrings();
}

class HomeStrings {
  final hello = "home.hello";
  final changeLanguage = "home.changeLanguage";
}

class LoginStrings {
  final title = "login.title";
  final username = "login.username";
  final password = "login.password";
}

class ErrorStrings {
  final noInternetError = "error.noInternet";
  final internalError = "error.internalError";
  final timeout = "error.timeout";
}
