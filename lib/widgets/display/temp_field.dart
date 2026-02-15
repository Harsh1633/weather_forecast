import 'package:flutter/material.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';

class TempField extends StatelessWidget {
  String unit, value;

  TempField({super.key, required this.unit, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500, fontFamily: 'Crimson'),
          ),
          Text(
            unit,
            style: const TextStyle(
                color: AppColors.darkSubText,
                fontSize: 20,
                // fontWeight: FontWeight.w500,
                fontFamily: 'Crimson'),
          )
        ],
      ),
    );
  }
}
