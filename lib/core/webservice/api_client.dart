import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:weather_forecast/core/webservice/api_endpoints.dart';
import 'package:weather_forecast/core/webservice/api_service.dart';


class ApiClient {
  static late final ApiService loginService;

  static void initServices() {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: ApiEndpoints.apiEndpoint,
        contentType: Headers.jsonContentType,
      )

      ..httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) =>
          true;
          return client;
        },
      );

    // dio.interceptors.addAll([
    //   HeaderInterceptor(),
    // ]);

    loginService = ApiService(dio);
  }
}


