import 'package:base/core/api/api_config.dart';

enum EndpointType {
  // Do not require accessToken when call API
  public,
  // Require accessToken when call API
  private
}

class EndPoint {
  final String endpoint;
  final EndpointType endpointType;

  EndPoint(this.endpoint, this.endpointType);

  Uri toURI() {
    return Uri.parse(APIConfig.baseURL + APIConfig.version + endpoint);
  }
}
