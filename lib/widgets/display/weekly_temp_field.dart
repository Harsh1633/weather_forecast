import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/core/assets/app_assets.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/functioning/helpers.dart';
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
            gradient: const LinearGradient(
                colors: [AppColors.tempColor1, AppColors.tempColor2]),
            border: Border.all(
                width: 1, color: AppColors.grayBorder.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Row(
            children: [
              Text(
                DateFormat('dd MMM')
                    .format(widget.forecast.date ?? DateTime.now()),
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.forecast.day?.condition?.text ?? '',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18)),
                  Row(
                    children: [
                      entryField(
                          detail:
                              "${widget.forecast.day?.avghumidity.toString()}%",
                          icon: AppAssets.humidity),
                      entryField(
                          detail: "${widget.forecast.day?.avgtempC.toString()}",
                          icon: AppAssets.celsius),
                      entryField(
                          detail: "${widget.forecast.day?.avgtempF.toString()}",
                          icon: AppAssets.fahrenheit),
                    ],
                  )
                ],
              ),
              Spacer(),
              Image.asset(
                "assets/icons/display/${Helpers().getIcon(widget.forecast.day?.condition?.text ?? '')}",
                width: 50,
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget entryField({required String detail, required String icon}) => Row(
      children: [
        Text(detail, style: const TextStyle(color: Colors.white, fontSize: 18)),
        Padding(
          padding: const EdgeInsets.only(left: 3, right: 12),
          child: SizedBox(
            height: 16,
            width: 16,
            child: Image.asset(icon),
          ),
        ),
      ],
    );
