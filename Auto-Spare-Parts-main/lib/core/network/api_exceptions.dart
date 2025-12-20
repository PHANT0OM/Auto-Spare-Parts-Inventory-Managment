import 'package:dio/dio.dart';
import 'package:auto_space/core/network/api_error.dart';

class ApiExceptions {
 static ApiError getApiException(error) {
  if (error is DioException) {
    switch (error.type) {

      case DioExceptionType.cancel:
        return ApiError(message: "Request Cancelled");

      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection Timeout");

      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Receive Timeout");

      case DioExceptionType.sendTimeout:
        return ApiError(message: "Send Timeout");

      case DioExceptionType.badResponse:
        if (error.response != null) {
          return ApiError(
            message:
              "Received invalid status code: ${error.response?.statusCode}",
            code: error.response?.statusCode,
          );
        } else {
          return ApiError(message: "Unknown Response Error");
        }

      case DioExceptionType.badCertificate:
        return ApiError(message: "Bad SSL Certificate");

      case DioExceptionType.connectionError:
        return ApiError(message: "Connection Error");

      case DioExceptionType.unknown:
        return ApiError(message: "Unknown Error: ${error.message}");
    }
  }

  return ApiError(message: "Unexpected Error: ${error.toString()}");
}

}
