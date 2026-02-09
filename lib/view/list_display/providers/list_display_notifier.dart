import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_forecast/core/webservice/network_providers.dart';
import 'package:weather_forecast/functioning/location_service.dart';
import 'package:weather_forecast/main.dart';
import 'package:weather_forecast/models/weekly_search_response_model.dart';


part 'list_display_notifier.g.dart';


@riverpod
class ListDisplayNotifier extends _$ListDisplayNotifier{

  @override
   WeeklyDataResponseModel? build() {
    return null;
  }


  Future<void> getWeeklyLocation() async {

    final apiService = ref.read(apiServiceProvider);

    try {

      final city = await LocationService.getCurrentCity();

      final response =
      await apiService.forecastData(API_KEY, city, "7");

      // ✅ update state
      state = response.data;

    } catch (e) {
      print(e.toString());
    }
  }

}