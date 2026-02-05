import 'package:dio/dio.dart';
import 'failure.dart';

class DioErrorMapper {
  static Failure map(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure(
          'No internet connection. Please try again.',
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;

        if (statusCode == 401 || statusCode == 403) {
          return const AuthFailure('Session expired. Please login again.');
        }

        return ServerFailure(
          error.response?.data?['message'] ?? 'Something went wrong on server',
          code: statusCode,
        );

      case DioExceptionType.cancel:
        return const NetworkFailure('Request cancelled');

      case DioExceptionType.unknown:
      default:
        return const UnknownFailure('Unexpected error occurred');
    }
  }
}
