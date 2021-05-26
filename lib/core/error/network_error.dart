import 'package:base/core/error/base_error.dart';

class NetWorkError extends BaseError {
  NetWorkError(statusCode, message) : super(statusCode, message);
}
