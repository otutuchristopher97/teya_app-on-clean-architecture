import 'failure.dart';

class ApiResponseFailure extends Failure {
  final String errMessage;
  final dynamic data;

  ApiResponseFailure({required this.errMessage, this.data});

  @override
  String get message => errMessage;
}
