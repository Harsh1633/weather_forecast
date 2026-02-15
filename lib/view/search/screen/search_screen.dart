import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/functioning/helpers.dart';
import 'package:weather_forecast/models/current_location_response_model.dart';
import 'package:weather_forecast/models/search_response_model.dart';
import 'package:weather_forecast/view/home/providers/home_notifier.dart';
import 'package:weather_forecast/view/search/providers/search_notifier.dart';
import 'package:weather_forecast/widgets/app_text_field/app_text_form_field.dart';
import 'package:weather_forecast/widgets/display/info_field.dart';
import 'package:weather_forecast/widgets/display/temp_field.dart';
import 'package:weather_forecast/widgets/gradient_container/gradient_info_container.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = ref.watch(homeNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Search Locations",
                      style: TextStyle(
                          color: Colors.white, fontSize: 22, fontFamily: "Crimson"),
                    ),
                    const Text(
                      "Search to know weather worldwide",
                      style: TextStyle(
                          color: AppColors.darkSubText,
                          fontSize: 16,
                          fontFamily: "Crimson"),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    searchTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    weatherData == null ? const SizedBox() : searchOutput(weatherData)
                  ],
                ),
              ),
            ),
          ),
          // if (weatherData == null)
          //   Positioned.fill(
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(
          //         sigmaX: 5,
          //         sigmaY: 5,
          //       ),
          //       child: Container(
          //         color: Colors.black.withOpacity(0.2),
          //         // optional dark overlay
          //         child: const Center(
          //           child: CircularProgressIndicator(),
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }

  Widget searchTextField() {
    late TextEditingController fieldController;

    return TypeAheadField<SearchResponseModel>(
      builder: (context, controller, focusNode) {
        fieldController = controller;

        return CustomTextFormField(
          controller: controller,
          focusNode: focusNode,
          onChanged: (value) {
            ref.read(homeNotifierProvider.notifier).clearWeather();

          },
        );
      },
      suggestionsCallback: (pattern) {
        if (pattern.isEmpty) {
          return Future.value([]);
        }

        return ref
            .read(searchNotifierProvider.notifier)
            .getSearchLocation(pattern);
      },
      itemBuilder: (context, suggestion) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: AppColors.primaryBlue,
            border: Border(
              bottom: BorderSide(width: 1, color: AppColors.blueBorder),
            ),
          ),
          child: Text(
            suggestion.name ?? "",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
      onSelected: (suggestion) {
        /// ✅ populate text
        fieldController.value = TextEditingValue(
          text: suggestion.name ?? "",
          selection: TextSelection.collapsed(
            offset: (suggestion.name ?? "").length,
          ),
        );

        /// ✅ close keyboard
        FocusScope.of(context).unfocus();

        /// ✅ call api
        ref.read(homeNotifierProvider.notifier).getCurrentLocationData(fromSearch: true,searchCity: suggestion.name);
      },
    );
  }

  Widget searchOutput(CurrentLocationResponseModel weatherData) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: GradientInfoContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Temperature", style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 20,
                  fontFamily: "Crimson"

              ),),
            ),
            Row(
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
            InfoField(
              info: 'Humidity ',
              infoImage: 'precipitation.png',
              value: "${weatherData?.current?.humidity} %",
              fontSize: 25,
            ),
            InfoField(
              info: 'Pressure ',
              infoImage: 'pressure-gauge.png',
              value: weatherData?.current?.pressureIn
                  ?.toString() ??
                  '',
              fontSize: 25,
            ),
            InfoField(
              info: 'Coordinates ',
              infoImage: 'location.png',
              value: Helpers().getCoordinates(
                  weatherData?.location?.lat ?? 0.0,
                  weatherData?.location?.lon ?? 0.0),
              fontSize: 20,
            ),
            InfoField(
              info: 'Wind ',
              infoImage: 'wind-power.png',
              value:
              "${weatherData?.current?.windKph.toString()} km/hr",
              fontSize: 25,
            ),

          ],
        )),
  );
}
