class ApiResponseException implements Exception {
  String exceptionMessage;
  dynamic data;

  ApiResponseException({required this.exceptionMessage, this.data});

  @override
  String toString() => '{exceptionMessage: $exceptionMessage, data: $data}';
}
