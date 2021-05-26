import 'package:base/core/api/endpoint.dart';

class APIConfig {
  // Base setting
  static var baseURL = "";
  static var version = "";
  static var clientID = "";
  static var clientSecret = "";

  static void setup(
      String baseURL, String version, String clientID, String clientSecret) {
    APIConfig.baseURL = baseURL;
    APIConfig.version = version;
    APIConfig.clientID = clientID;
    APIConfig.clientSecret = clientSecret;
  }

  // Endpoint
  static var login = EndPoint("/login", EndpointType.public);
}
