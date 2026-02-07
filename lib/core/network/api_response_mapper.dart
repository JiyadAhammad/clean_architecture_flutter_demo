import '../models/api_response.dart';

class ApiResponseMapper {
  static ApiResponse<T> fromJson<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return ApiResponse<T>.fromJson(
      json,
      (data) => fromJson(data as Map<String, dynamic>),
    );
  }
}
