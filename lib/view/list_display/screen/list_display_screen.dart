import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/functioning/helpers.dart';
import 'package:weather_forecast/models/weekly_search_response_model.dart';
import 'package:weather_forecast/view/list_display/providers/list_display_notifier.dart';
import 'package:weather_forecast/widgets/display/hourly_field.dart';
import 'package:weather_forecast/widgets/display/weekly_temp_field.dart';

class ListDisplayScreen extends ConsumerStatefulWidget {
  const ListDisplayScreen({super.key});

  @override
  ConsumerState<ListDisplayScreen> createState() => _ListDisplayScreenState();
}

class _ListDisplayScreenState extends ConsumerState<ListDisplayScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(listDisplayNotifierProvider.notifier).getWeeklyLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final forecastData = ref.watch(listDisplayNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        "${forecastData?.location?.name},${forecastData?.location?.country}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Cormorant"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "24-Hour Forecast ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Crimson"),
                    ),
                    _hourlyForecast(
                        hours:
                            forecastData?.forecast?.forecastday?.first.hour ??
                                []),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Weekly Forecast",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Crimson"),
                    ),
                    _listView(forecastData?.forecast?.forecastday ?? []),
                  ],
                ),
              ),
            ),
          ),
          if (forecastData == null)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _listView(List<Forecastday> forecastDays) => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return WeeklyTempField(forecast: forecastDays[index]);
        },
        itemCount: forecastDays.length,
      );

  Widget _hourlyForecast({required List<Hour> hours}) => SizedBox(
        height: 130,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var hour = hours[index];
            return HourlyField(
              hour: hour,
            );
          },
          itemCount: hours.length,
        ),
      );
}
