
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_forecast/core/webservice/network_providers.dart';
import 'package:weather_forecast/main.dart';
import 'package:weather_forecast/models/search_response_model.dart';


part 'search_notifier.g.dart';


@riverpod
class SearchNotifier extends _$SearchNotifier{


  @override
  List<SearchResponseModel> build() {
    return [];
  }


  Future<List<SearchResponseModel>> getSearchLocation(String val) async {

    final apiService = ref.read(apiServiceProvider);

    try {

      final response =
      await apiService.searchData(API_KEY, val);

      state = response.data; // optional (if you want global state)

      return response.data; // 🔥 IMPORTANT

    } catch (e) {
      print(e.toString());
      return [];
    }
  }


}