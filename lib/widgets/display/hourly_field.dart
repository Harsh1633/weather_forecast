import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/functioning/helpers.dart';
import 'package:weather_forecast/models/weekly_search_response_model.dart';

class HourlyField extends ConsumerWidget {
  final Hour hour;

  const HourlyField({super.key,required this.hour});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 8),
      child: Container(
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
            gradient: const LinearGradient(
                colors: [AppColors.tempColor1, AppColors.tempColor2]),
            border: Border.all(
                width: 1, color: AppColors.grayBorder.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 8),
          child: Column(
            children: [
              Text(
                DateFormat('h a').format(
                  DateTime.parse(hour.time!.replaceFirst(' ', 'T')),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                height: 6,
              ),
              Image.asset(
                "assets/icons/display/${Helpers().getIcon(hour.condition?.text ?? '')}",
                width: 36,
                height: 36,
              ),
              const SizedBox(
                height:10,
              ),
              Text("${hour.tempC?.toString()} °C" , style : TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
