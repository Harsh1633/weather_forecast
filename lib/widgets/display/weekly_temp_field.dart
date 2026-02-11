import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/functioning/get_icon.dart';
import 'package:weather_forecast/models/weekly_search_response_model.dart';

class WeeklyTempField extends ConsumerStatefulWidget {
  final Forecastday forecast;

  const WeeklyTempField({super.key, required this.forecast});

  @override
  ConsumerState<WeeklyTempField> createState() => _WeeklyTempFieldState();
}

class _WeeklyTempFieldState extends ConsumerState<WeeklyTempField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: const Offset(5, 5),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.25)),
              BoxShadow(
                  offset: const Offset(-2, -2),
                  blurRadius: 4,
                  color: AppColors.grayBorder.withOpacity(0.2))
            ],
            gradient: const LinearGradient(colors: [
              AppColors.tempColor1,
              AppColors.tempColor2
            ]),
            border: Border.all(
                width: 1,
                color: AppColors.grayBorder.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8)),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(12),
        //   gradient: const LinearGradient(
        //       colors: [AppColors.blueBorder, AppColors.tempColor2]),
        //   boxShadow: [
        //     BoxShadow(
        //         offset: const Offset(2, 2),
        //         blurRadius: 8,
        //         color: AppColors.tempColor2.withOpacity(0.5)),
        //     BoxShadow(
        //         offset: const Offset(-2, -2),
        //         blurRadius: 8,
        //         color: AppColors.grayBorder.withOpacity(0.25))
        //   ],
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('dd-MMM-yyyy')
                    .format(widget.forecast.date ?? DateTime.now()),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              entryDetails(
                  key: "Temp(C)",
                  value: (widget.forecast.day?.avgtempC ?? 0).toString(),
                  alignment: CrossAxisAlignment.start)
            ],
          ),
        ),
      ),
    );
  }
}

Widget entryDetails(
        {required String key,
        required String value,
        required CrossAxisAlignment alignment}) =>
    Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          key,
          style: const TextStyle(fontSize: 12, color: AppColors.darkSubText),
        ),
        Text(value,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.blue.withOpacity(0.9)))
      ],
    );
