
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_forecast/core/webservice/api_service.dart';
import 'package:weather_forecast/core/webservice/network_providers.dart';


part 'home_notifier.g.dart';


@riverpod
class HomeNotifier extends _$HomeNotifier{
  final dio = Dio();



  @override
  int build() {
    return 0;
  }

  Future<void> getCurrentLocationData() async{
    final apiService = ref.read(apiServiceProvider);

    try{
      var currentDataResponse = apiService.currentData("d771530ea2c04342a4a114808240807",'mumbai');

      print(currentDataResponse);

    }
    catch(e){
      print(e.toString());
    }
  }

}