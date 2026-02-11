import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/models/weekly_search_response_model.dart';
import 'package:weather_forecast/view/list_display/providers/list_display_notifier.dart';
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
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Weekly Forecast",
                      style: TextStyle(
                          color: Colors.white, fontSize: 22, fontFamily: "Crimson"),
                    ),
                    _listView(forecastData?.forecast?.forecastday ?? []),
                  ],
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
                    // optional dark overlay
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
          ],
        ),
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

  Widget displayCard() => Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.2,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppColors.blueBorder, AppColors.tempColor2]),
          boxShadow: [
            BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 12,
                color: AppColors.tempColor2.withOpacity(0.5)),
            BoxShadow(
                offset: const Offset(-4, -4),
                blurRadius: 12,
                color: AppColors.grayBorder.withOpacity(0.25))
          ],
        ),
        child: const Column(
          children: [Text("qasd")],
        ),
      );
}
