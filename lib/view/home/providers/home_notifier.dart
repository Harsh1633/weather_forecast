
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_forecast/core/webservice/api_service.dart';
import 'package:weather_forecast/core/webservice/network_providers.dart';
import 'package:weather_forecast/functioning/location_service.dart';
import 'package:weather_forecast/main.dart';
import 'package:weather_forecast/models/current_location_response_model.dart';


part 'home_notifier.g.dart';


@riverpod
class HomeNotifier extends _$HomeNotifier{

  @override
  CurrentLocationResponseModel? build() {
    return null;
  }


  Future<void> getCurrentLocationData({bool? fromSearch = false, String? searchCity}) async {

    final apiService = ref.read(apiServiceProvider);

    try {

      final city = await LocationService.getCurrentCity();

      final response =
      await apiService.currentData(API_KEY, fromSearch?? false ? (searchCity ?? '') :  city);

      // ✅ update state
      state = response.data;

    } catch (e) {
      print(e.toString());
    }
  }

  void clearWeather() {
    state = null;
  }

}