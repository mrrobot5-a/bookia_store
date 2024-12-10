import 'dart:developer';

import 'package:bookia_store/core/services/remote/endpoints.dart';
import 'package:bookia_store/features/intro/auth/data/model/request/user_model_params.dart';
import 'package:bookia_store/features/intro/auth/data/model/response/user_model_response/user_model_response.dart';
import 'package:dio/dio.dart';

class AuthRepoapi {
  //register method
 static Future<UserModelResponse?> register(UserModelParams params) async {
    try {
      var response = await Dio().post(
        EndpointsApp.baseUrl + EndpointsApp.registerEndPoint,
        data: params.toJson(),
      );
      if (response.statusCode == 201) {
        return UserModelResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
