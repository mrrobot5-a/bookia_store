import 'dart:developer';

import 'package:bookia_store/core/services/remote/dio_provider.dart';
import 'package:bookia_store/core/services/remote/endpoints.dart';
import 'package:bookia_store/features/intro/auth/data/model/request/user_model_params.dart';
import 'package:bookia_store/features/intro/auth/data/model/response/user_model_response/user_model_response.dart';
import 'package:dio/dio.dart';

class AuthRepoapi {
  //register method
  static Future<UserModelResponse?> register(UserModelParams params) async {
    try {
      log('Sending request to ${EndpointsApp.baseUrl}${EndpointsApp.registerEndPoint}');
      log('Request payload: ${params.toJson()}');

      var response = await DioProvider.post(
        endpoints: EndpointsApp.registerEndPoint,
        data: params.toJson(),
      );

      if (response.statusCode == 201) {
        log('Registration successful!');
        return UserModelResponse.fromJson(response.data);
      } else {
        log('Unexpected response: ${response.statusCode}, ${response.data}');
        return null;
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        log('Server returned an error: ${dioError.response?.statusCode}');
        log('Error details: ${dioError.response?.data}');
        if (dioError.response?.statusCode == 422) {
          log('Validation error: Check your payload or server validation rules.');
        }
      } else {
        log('Dio error without response: ${dioError.message}');
      }
      return null;
    } catch (e) {
      log('Unexpected error: ${e.toString()}');
      return null;
    }
  }

  static Future<UserModelResponse?> login(UserModelParams params) async {
    try {
      var response = await DioProvider.post(
        endpoints: EndpointsApp.loginEndpoint,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return UserModelResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
