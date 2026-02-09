import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/functioning/get_animation.dart';
import 'package:weather_forecast/functioning/get_coordinate.dart';
import 'package:weather_forecast/view/home/providers/home_notifier.dart';
import 'package:weather_forecast/widgets/display/info_field.dart';
import 'package:weather_forecast/widgets/display/temp_field.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifierProvider.notifier).getCurrentLocationData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = ref.watch(homeNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hello User!!!! 😊",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "Crimson"),
                            ),
                            Text(
                              DateFormat('dd-MMMM-yyyy').format(DateTime.now()),
                              style: const TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Crimson"),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                      child: Center(
                        child: Text(
                          "${weatherData?.location?.name},${weatherData?.location?.country}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cormorant"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      height: 120,
                      child: OverflowBox(
                        minHeight: 400,
                        maxHeight: 400,
                        child: Opacity(
                            opacity: 0.4,
                            child: Lottie.asset(
                                'assets/animations/${get_animation(weatherData?.current?.condition?.text ?? '')}')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Center(
                      child: Text(
                        weatherData?.current?.condition?.text ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "Crimson"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Center(
                        child: Container(
                      width: MediaQuery.of(context).size.width,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TempField(
                              unit: '°Celsius',
                              value:
                                  weatherData?.current?.tempC.toString() ?? ''),
                          const SizedBox(
                            width: 30,
                          ),
                          TempField(
                              unit: '°Fahrenheit',
                              value: weatherData?.current?.tempF.toString() ??
                                  ''.toString()),
                          const SizedBox(
                            width: 30,
                          ),
                          TempField(
                              unit: 'Kelvin',
                              value: ((weatherData?.current?.tempC ?? 0) + 273)
                                  .toString()),
                        ],
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.29,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(6, 6),
                                  blurRadius: 12,
                                  color: AppColors.tempColor2.withOpacity(0.5)),
                              BoxShadow(
                                  offset: const Offset(-6, -6),
                                  blurRadius: 12,
                                  color: AppColors.tempColor1.withOpacity(0.25))
                            ],
                            gradient: const LinearGradient(colors: [
                              AppColors.tempColor1,
                              AppColors.tempColor2
                            ]),
                            border: Border.all(
                                color: AppColors.grayBorder.withOpacity(0.5),
                                width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoField(
                                info: 'Humidity ',
                                infoImage: 'precipitation.png',
                                value: "${weatherData?.current?.humidity} %",
                                fontSize: 25,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InfoField(
                                info: 'Pressure ',
                                infoImage: 'pressure-gauge.png',
                                value: weatherData?.current?.pressureIn
                                        ?.toString() ??
                                    '',
                                fontSize: 25,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.13,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(6, 6),
                                        blurRadius: 12,
                                        color: AppColors.tempColor2
                                            .withOpacity(0.5)),
                                    BoxShadow(
                                        offset: const Offset(-6, -6),
                                        blurRadius: 12,
                                        color: AppColors.tempColor1
                                            .withOpacity(0.25))
                                  ],
                                  gradient: const LinearGradient(colors: [
                                    AppColors.tempColor1,
                                    AppColors.tempColor2
                                  ]),
                                  border: Border.all(
                                      color:
                                          AppColors.grayBorder.withOpacity(0.5),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InfoField(
                                      info: 'Coordinates ',
                                      infoImage: 'location.png',
                                      value: get_coord(
                                          weatherData?.location?.lat ?? 0.0,
                                          weatherData?.location?.lon ?? 0.0),
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.13,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(6, 6),
                                        blurRadius: 12,
                                        color: AppColors.tempColor2
                                            .withOpacity(0.5)),
                                    BoxShadow(
                                        offset: const Offset(-6, -6),
                                        blurRadius: 12,
                                        color: AppColors.tempColor1
                                            .withOpacity(0.25))
                                  ],
                                  gradient: const LinearGradient(colors: [
                                    AppColors.tempColor1,
                                    AppColors.tempColor2
                                  ]),
                                  border: Border.all(
                                      color:
                                          AppColors.grayBorder.withOpacity(0.5),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InfoField(
                                      info: 'Wind ',
                                      infoImage: 'wind-power.png',
                                      value: "${weatherData?.current?.windKph.toString()} km/hr",
                                      fontSize: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (weatherData == null)
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
}
