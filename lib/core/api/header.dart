import 'dart:io' show Platform;

class HeaderKey {
  static final deviceType = "X-Mobile-Device-Type";
}

class HeaderValue {
  static get deviceType => Platform.isIOS ? 'iOS' : 'Android';
}

class APIHeader {
  static Map<String, String> standardHeader() {
    return {
      HeaderKey.deviceType: HeaderValue.deviceType,
    };
  }

  static Map<String, String> privateHeader() {
    var standardHeader = APIHeader.standardHeader();
    //Update authorization later
    return standardHeader;
  }
}
