import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:base/application/dependency_injection.dart';
import 'package:base/commons/const/strings.dart';
import 'package:base/commons/utils/common_function.dart';
import 'package:base/commons/utils/connectivity_util.dart';
import 'package:base/core/api/header.dart';
import 'package:base/core/api/endpoint.dart';
import 'package:base/core/error/base_error.dart';
import 'package:base/core/error/network_error.dart';
import 'package:base/core/networking/http_method.dart';
import 'package:base/domain/models/response/api_response.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    var option = BaseOptions(connectTimeout: Duration(seconds: 30));
    dio = Dio(option);
  }

  Future<APIResponse> request(EndPoint endpoint, HttpMethod method,
      Map<String, dynamic>? parameters) async {
    if (!getIt<ConnectivityUtil>().hasConnection) {
      return APIResponse(
          error: NetWorkError(500, translate(Strings.error.noInternetError)));
    }
    final uri = endpoint.toURI();
    Response response;

    Map<String, String> headers;
    if (endpoint.endpointType == EndpointType.private) {
      headers = APIHeader.privateHeader();
    } else {
      headers = APIHeader.standardHeader();
    }
    var options = Options(headers: headers);

    try {
      switch (method) {
        case HttpMethod.get:
          response = await dio.getUri(uri, options: options);
          break;
        case HttpMethod.post:
          response = await dio.postUri(uri, options: options, data: parameters);
          break;
        case HttpMethod.put:
          response = await dio.putUri(uri, options: options, data: parameters);
          break;
      }
      final responseJson = _parseResponse(response);
      return APIResponse(data: responseJson);
    } on DioException catch (error) {
      final parsedError = _parseError(error);
      return APIResponse(error: parsedError);
    } catch (error) {
      final baseError = BaseError(500, Strings.error.internalError);
      return APIResponse(error: baseError);
    }
  }

  dynamic _parseResponse(Response response) {
    var responseJson = json.decode(response.data.toString());
    return responseJson;
  }

  BaseError _parseError(DioException error) {
    switch (error.type) {
      case DioExceptionType.unknown:
        return _handleServerResponseError(error);
      case DioExceptionType.connectionTimeout ||
            DioExceptionType.sendTimeout ||
            DioExceptionType.receiveTimeout:
        return NetWorkError(500, translate(Strings.error.timeout));
      default:
        return BaseError(500, translate(Strings.error.internalError));
    }
  }

  BaseError _handleServerResponseError(DioException error) {
    final statusCode = error.response?.statusCode ?? 500;
    switch (statusCode) {
      case 401:
      // handle logout or refresh token here
      case 400:
      // Handle get error message from server
      default:
        return BaseError(statusCode, translate(Strings.error.internalError));
    }
  }
}
