import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_forecast/pages/page1.dart';
// import 'package:weather_forecast/functioning/temp.dart';
import 'dart:convert';
import 'package:weather_forecast/widgets/textfield.dart';

const API_KEY = '28792283d0791c289411e6c81fad5c11';
// const String cityName = "London";


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Page1(),
  ));
}

