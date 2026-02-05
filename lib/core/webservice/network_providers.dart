import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/webservice/api_service.dart';
import 'package:weather_forecast/core/webservice/api_endpoints.dart';


/// DIO PROVIDER
final dioProvider = Provider<Dio>((ref) {

  return Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.apiEndpoint,
      contentType: Headers.jsonContentType,
    ),
  );

});


/// API SERVICE PROVIDER
final apiServiceProvider = Provider<ApiService>((ref) {

  final dio = ref.watch(dioProvider);

  return ApiService(dio);

});
