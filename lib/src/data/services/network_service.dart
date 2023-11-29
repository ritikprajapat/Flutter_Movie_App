import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dart:convert';

import '../../core/core.dart';
import '../data.dart';

class NetworkService {
  late Dio _dio;

  NetworkService() {
    prepareRequest();
  }
  static final NetworkService shared = NetworkService();

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      baseUrl: AppUrls.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        'Accept': Headers.jsonContentType,
      },
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    _dio.interceptors.add(
      PrettyDioLogger(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        compact: false,
      ),
    );
  }

  Future<dynamic> getAuth({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      final authDio = Dio();

      authDio.interceptors.clear();

      authDio.interceptors.add(
        PrettyDioLogger(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
        ),
      );

      final headers = {
        'Authorization': 'Bearer ${AppConstants.token}',
      };

      final response = await authDio.get(
        path,
        data: data,
        queryParameters: query,
        options: Options(
          headers: headers,
          contentType: "application/json",
          responseType: ResponseType.json,
        ),
      );

      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: query,
        data: jsonEncode(data),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        queryParameters: query,
        data: jsonEncode(data),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    try {
      final response = await _dio.put(
        path,
        queryParameters: query,
        data: jsonEncode(data),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        queryParameters: query,
        data: jsonEncode(data),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: query,
        data: jsonEncode(data),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }
}
