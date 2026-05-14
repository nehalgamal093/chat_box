import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@lazySingleton
class APIManager {
  late Dio _dio;

  APIManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
        headers: {'Content-Type': 'application/json'},
        validateStatus: (status) => true,
      ),
    );
    // _dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: true,
    //     responseBody: true,
    //     requestBody: true,
    //     request: true,
    //   ),
    // );
    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       handler.next(options);
    //     },
    //     onResponse: (response, handler) {
    //       handler.next(response);
    //     },
    //     onError: (error, handler) {
    //       handler.next(error);
    //     },
    //   ),
    // );
  }

  Future<Response> postRequest(
    String endpoint,
    dynamic data, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw Exception('Failed To POST $e');
    }
  }
  Future<Response> putRequest(
      String endpoint,
      dynamic data, {
        Map<String, dynamic>? headers,
      }) async {
    try {
      return await _dio.put(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw Exception('Failed To PUT $e');
    }
  }
  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? params, Map<String, dynamic>? headers}) async {
    try {
      return await _dio.get(endpoint,
          queryParameters: params, options: Options(headers: headers));
    } on DioException catch (e) {
      throw Exception('Failed to GET $e');
    }
  }
}
