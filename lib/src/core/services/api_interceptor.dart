import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:teya/src/core/error/api_request_failure.dart';
import 'package:teya/src/core/error/api_response_failure.dart';
import 'package:teya/src/core/error/failure.dart';
import 'package:teya/src/core/exceptions/api_request_exception.dart';
import 'package:teya/src/core/exceptions/api_response_exception.dart';

Future<Either<Failure, R>> apiInterceptor<R>(Future<R>? Function() func) async {
  try {
    final res = await func();
    return Right(res as R);
  } on ApiRequestException catch (e) {
    return Left(ApiRequestFailure(e.response));
  } on ApiResponseException catch (e) {
    debugPrint(e.toString());
    return Left(ApiResponseFailure(errMessage: e.exceptionMessage));
  }
}
