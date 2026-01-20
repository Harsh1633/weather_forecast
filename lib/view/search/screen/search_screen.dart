import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/widgets/app_text_field/app_text_form_field.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {

  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primaryBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Search Locations",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "Crimson"),
                ),
                const Text(
                  "Search to know weather worldwide",
                  style: TextStyle(
                      color: AppColors.darkSubText,
                      fontSize: 16,
                      fontFamily: "Crimson"),
                ),
                SizedBox(height: 12,),
                _searchTextField()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextField() => CustomTextFormField(
    controller: locationController,
    onTapOutside: (val){},
    onSubmitted: (val){},
    inputFormatters: [
      LengthLimitingTextInputFormatter(50),
      FilteringTextInputFormatter.allow(
        RegExp(r'[a-zA-Z0-9 ]'),
      ),
    ],
  );
}
