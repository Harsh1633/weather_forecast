import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/view/app_dashboard/screen/app_dashboard_screen.dart';


const API_KEY = "d771530ea2c04342a4a114808240807";



void main() {

  runApp(ProviderScope(
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppDashboardScreen(),
    ),
  ));
}

