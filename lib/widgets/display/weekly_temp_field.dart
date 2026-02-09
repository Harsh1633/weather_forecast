import 'package:flutter/material.dart';
import 'package:weather_forecast/functioning/get_icon.dart';
import 'package:weather_forecast/models/weekly_search_response_model.dart';

class WeeklyTempField extends StatelessWidget {
  final Forecastday forecast;

  const WeeklyTempField({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      height: MediaQuery.of(context).size.height / 8,
      child: Column(
        children: [
          // Image.asset(
          //   'assets/icons/display/${get_icon(textValues.reverse[forecast.day?.condition ?? ''] ?? '')}',
          // )
        ],
      ),
    );
  }
}
