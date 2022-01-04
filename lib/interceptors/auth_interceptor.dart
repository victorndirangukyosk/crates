import 'dart:io';

import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = 'application/json';
    handler.next(options);
  }
}
