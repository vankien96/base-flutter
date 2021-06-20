import 'package:base/core/error/base_error.dart';

class APIResponse {
  Map<String, dynamic>? data;
  BaseError? error;

  APIResponse({this.data, this.error});
}
