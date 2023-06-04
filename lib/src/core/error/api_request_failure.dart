// import 'package:get/get_connect/http/src/response/response.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'failure.dart';

class ApiRequestFailure extends Failure {
  final Response response;

  ApiRequestFailure(this.response);

  @override
  String get message {
    return _extractErrorMessage();
  }

  int? get code {
    try {
      final c = response.statusCode;
      return c;
    } catch (e) {
      debugPrint('_Error extracting code from response: ${response.data}');
      return 500;
    }
  }

  String _extractErrorMessage() {
    dynamic msg;
    if (response.data is Map) {
      msg = response.data['message'] ?? "";
    } else {
      msg = 'Internal server error, please try again later.';
    }

    return msg;
  }
}
