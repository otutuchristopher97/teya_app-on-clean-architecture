// ignore_for_file: file_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:teya/src/core/exceptions/api_request_exception.dart';
import 'package:teya/src/core/exceptions/api_response_exception.dart';
import 'package:teya/src/core/resources/string/app_strings.dart';
import 'package:teya/src/core/resources/string/config_strings.dart';

class NetworkUtils {
  final Dio _dio;
  late Response response;
  NetworkUtils(this._dio);

  Future<dynamic> dioGetRequest(String url, {Options? options}) async {
    response = await _dio
        .get(ConfigString.BASE_URL + url, options: defaultOptions)
        .then(_handleDioResponse)
        .catchError(_handleDioError);
    return processResponse(response, url);
  }

  Future<dynamic> dioPostRequest(var url, var request,
      {Options? options}) async {
    response = await _dio
        .post(ConfigString.BASE_URL + url,
            data: request, options: defaultOptions)
        .then(_handleDioResponse)
        .catchError(_handleDioError);
    return Future.value(response);
  }

  Future<dynamic> dioPutRequest(var url, var request,
      {Options? options}) async {
    response = await _dio
        .put(ConfigString.BASE_URL + url,
            data: request, options: defaultOptions)
        .then(_handleDioResponse)
        .catchError(_handleDioError);
    return Future.value(response);
  }

  Future<dynamic> dioDeleteRequest(String url, Options? options) async {
    dynamic response = await _dio
        .delete(ConfigString.BASE_URL + url, options: defaultOptions)
        .then(_handleDioResponse)
        .catchError(_handleDioError);
    return response;
  }

  dynamic _handleDioResponse(dynamic response) {
    debugPrint("response_aye: $response");
    if (![200, 201].contains(response.statusCode)) {
      throw ApiResponseException(exceptionMessage: response["message"]);
    }

    return response;
  }

  dynamic _handleDioError(dynamic dioError) {
    switch (dioError.response.statusCode) {
      default:
        Map<String, dynamic> err = jsonDecode(dioError.response.toString());
        throw ApiResponseException(
            exceptionMessage:
                err["message"] != null && err["message"].toString().isNotEmpty
                    ? err["message"]
                    : AppString.GENERAL_ERROR_MSG);
    }
  }

  Map<String, dynamic> processResponse(Response res, String endpoint) {
    if (![200, 201, 202].contains(res.statusCode)) {
      throw ApiRequestException(res);
    }

    if (res.data is Map) {
      return res.data;
    } else {
      try {
        return jsonDecode(res.data);
      } catch (e) {
        debugPrint(res.data);
        throw ApiResponseException(
            exceptionMessage: AppString.GENERAL_ERROR_MSG);
      }
    }
  }

  Options get defaultOptions => Options(
    headers: {},
  );
}
