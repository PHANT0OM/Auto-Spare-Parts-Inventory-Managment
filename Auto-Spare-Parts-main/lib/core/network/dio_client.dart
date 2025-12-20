import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000',
      //connectTimeout: 5000,
      //receiveTimeout: 3000,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  Dio get dio => _dio;
}
