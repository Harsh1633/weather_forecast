import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/pages/page1.dart';
import 'package:weather_forecast/view/app_dashboard/screen/app_dashboard_screen.dart';


const API_KEY = '144d3bf745fe9b080033eb7202ca731d';



void main() {
  runApp(ProviderScope(
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppDashboardScreen(),
    ),
  ));
}

