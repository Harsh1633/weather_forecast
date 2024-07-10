import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> getWeeklyData() async {
  try {
    String second_url = "http://api.weatherapi.com/v1/forecast.json?key=d771530ea2c04342a4a114808240807&q=London&days=7";

    final response = await http.get(Uri.parse(second_url));
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("Connection Success for Weekly API");
      var weekly_decodedData = jsonDecode(response.body);
      String date= weekly_decodedData['forecast']['forecastday'][1]['date'];
      double avg_temp_in_c= weekly_decodedData['forecast']['forecastday'][1]['day']['avgtemp_c'];
      double avg_temp_in_f= weekly_decodedData['forecast']['forecastday'][1]['day']['avgtemp_f'];
      double humidity= weekly_decodedData['forecast']['forecastday'][1]['day']['avghumidity'];
      print(date);
      print(avg_temp_in_c);
      print(avg_temp_in_f);
      print(humidity);


    }
  }
  catch (e) {
    print('Error: $e');
  }
}