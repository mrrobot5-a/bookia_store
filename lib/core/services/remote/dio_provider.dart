import 'package:bookia_store/core/services/remote/endpoints.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: EndpointsApp.baseUrl,
    ));
  }

//Get Method
  static Future<Response> get(
      {required String endpoints, Map<String, dynamic>? data}) async {
    return await _dio.get(
      endpoints,
      data: data,
    );
  }

  //Post Method
  static Future<Response> post(
      {required String endpoints, Map<String, dynamic>? data}) async {
    return await _dio.post(endpoints, data: data);
  }
}
