import 'package:bookia_store/core/services/remote/dio_provider.dart';
import 'package:bookia_store/core/services/remote/endpoints.dart';
import 'package:bookia_store/features/intro/home/data/models/get_new_arrivals_response/get_new_arrivals_response.dart';

class HomeRepo {
  Future<GetNewArrivalsResponse?> getNewArrivalsBooks() async {
    try {
      var response =
          await DioProvider.get(endpoints: EndpointsApp.newArrivalsEndPoint);
      if (response.statusCode == 200) {
        return GetNewArrivalsResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
