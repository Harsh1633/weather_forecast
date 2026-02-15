import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/models/search_response_model.dart';
import 'package:weather_forecast/view/search/providers/search_notifier.dart';
import 'package:weather_forecast/widgets/app_text_field/app_text_form_field.dart';

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
    final searchData = ref.watch(searchNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
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
                _searchTextField()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextField() => TypeAheadField<SearchResponseModel>(
        builder: (context, controller, focusNode) {
          return CustomTextFormField(
            controller: controller,
            focusNode: focusNode,
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
                bottom: BorderSide(width: 12,color: AppColors.blueBorder)
              )
            ),
            child : Text(
              suggestion.name ?? "",
              style: const TextStyle(color: Colors.white,fontSize: 18),
            )
          );

        },
        onSelected: (suggestion) {
          print(suggestion.name);
        },
      );
}
