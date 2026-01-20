import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';

class ListDisplayScreen extends ConsumerStatefulWidget {
  const ListDisplayScreen({super.key});

  @override
  ConsumerState<ListDisplayScreen> createState() => _ListDisplayScreenState();
}

class _ListDisplayScreenState extends ConsumerState<ListDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primaryBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: displayCard(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget displayCard() => Container(
    width: MediaQuery.sizeOf(context).width,
    height: MediaQuery.sizeOf(context).height * 0.2,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.blueBorder,
          AppColors.tempColor2
        ]
      ),
      boxShadow: [
        BoxShadow(
            offset: Offset(4,4),
            blurRadius: 12,
            color: AppColors.tempColor2.withOpacity(0.5)
        ),
        BoxShadow(
            offset: Offset(-4,-4),
            blurRadius: 12,
            color: AppColors.grayBorder.withOpacity(0.25)
        )
      ],
    ),
    child: Column(
      children: [
        Text("qasd")
      ],
    ),
  );
}
