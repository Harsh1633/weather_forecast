import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_forecast/core/webservice/api_endpoints.dart';
import 'package:weather_forecast/models/current_location_response_model.dart';
import 'package:weather_forecast/models/search_response_model.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.apiEndpoint)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(FinxAPIs.current)
  Future<HttpResponse<CurrentLocationResponseModel>> currentData(
      @Query('key') String key,
      @Query('q') String location
      );

  @GET(FinxAPIs.forecast)
  Future<HttpResponse<CurrentLocationResponseModel>> forecastData(
      @Query('key') String key,
      @Query('q') String location,
      @Query('days') String days,
      );

  @GET(FinxAPIs.search)
  Future<HttpResponse<List<SearchResponseModel>>> searchData(
      @Query('key') String key,
      @Query('q') String location
      );
}