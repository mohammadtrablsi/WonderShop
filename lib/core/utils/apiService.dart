import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "https://fakestoreapi.com";

  ApiService(this._dio);

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        "$baseUrl$endPoint",
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      print('GET Error: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }

  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        "$baseUrl$endPoint",
        data: data,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      print('POST Error: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }

  Future<dynamic> put({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        "$baseUrl$endPoint",
        data: data,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      print('PUT Error: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }

  Future<dynamic> delete({
    required String endPoint,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        "$baseUrl$endPoint",
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      print('DELETE Error: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }
}
