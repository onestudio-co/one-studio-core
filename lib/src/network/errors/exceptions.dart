import 'dart:convert';

import 'failures.dart';

class ServerException implements Exception {
  final Map<String, dynamic> errors;
  final int? statusCode;

  ServerException({required this.errors, this.statusCode});

  static ServerException fromResponse(String body, [int? statusCode]) {
    return ServerException(errors: json.decode(body), statusCode: statusCode);
  }

  Failure toFailure() => ServerFailure(error: errors, code: statusCode ?? 0);
}
class CacheException implements Exception{
  const CacheException({required this.error,});

  final Map<String, dynamic> error;
  Failure toFailure() => CacheFailure(error: error,);

}
