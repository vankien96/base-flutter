import 'package:base/core/error/base_error.dart';

class ParseError extends BaseError {
  ParseError(statusCode, message) : super(statusCode, message);
}
