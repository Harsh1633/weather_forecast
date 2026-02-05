import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
import 'package:weather_forecast/functioning/get_animation.dart';
import 'package:weather_forecast/functioning/get_coordinate.dart';
import 'package:weather_forecast/view/home/providers/home_notifier.dart';
import 'package:weather_forecast/widgets/other_field.dart';
import 'package:weather_forecast/widgets/temp_field.dart';

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
      ref.read(homeNotifierProvider.notifier)
          .getCurrentLocationData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primaryBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
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
                  // ElevatedButton(
                  //     onPressed: (){
                  //       Navigator.of(context).push
                  //         (MaterialPageRoute(
                  //           builder: (context)=> Weekly()));
                  //     },
                  //     style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
                  //     ),
                  //     child: Text("Weekly",style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 20
                  //     ),))
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                  child: Center(
                    child: Text(
                      // "${widget.city.toCapitalCase()}, ${widget.country}",
                      "Mumbai,India",
                      style: TextStyle(
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
                        child: Lottie.asset('assets/animations/${get_animation("Sunny")}')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Center(
                  child: Text(
                    "SUNNY",
                    style: TextStyle(color: Colors.white,
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
                            offset: Offset(5,5),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.25)
                          ),
                          BoxShadow(
                              offset: Offset(-2,-2),
                              blurRadius: 4,
                              color: AppColors.grayBorder.withOpacity(0.2)
                          )
                        ],
                          gradient: LinearGradient(colors:  [AppColors.tempColor1,AppColors.tempColor2]),
                          border: Border.all(width: 1, color: AppColors.grayBorder.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TempField(unit: '°Celsius', value: "12".toString()),
                          SizedBox(width: 30,),
                          TempField(unit: '°Fahrenheit', value: "120".toString()),
                          SizedBox(width: 30,),
                          TempField(unit: 'Kelvin', value: "273".toString()),
                        ],
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 5,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.29,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(6,6),
                              blurRadius: 12,
                              color: AppColors.tempColor2.withOpacity(0.5)
                          ),
                          BoxShadow(
                              offset: Offset(-6,-6),
                              blurRadius: 12,
                              color: AppColors.tempColor1.withOpacity(0.25)
                          )
                        ],
                        gradient: LinearGradient(
                          colors: [
                            AppColors.tempColor1,AppColors.tempColor2
                          ]
                        ),
                        border: Border.all(color: AppColors.grayBorder.withOpacity(0.5), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Field(info: 'Humidity ', info_image: 'precipitation.png',
                            value: "${34} %",fontsize: 25,),
                          SizedBox(height: 30,),
                          Field(info: 'Pressure ', info_image: 'pressure-gauge.png',
                            value: "25",fontsize: 25,),
                        ],),),
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(6,6),
                                    blurRadius: 12,
                                    color: AppColors.tempColor2.withOpacity(0.5)
                                ),
                                BoxShadow(
                                    offset: Offset(-6,-6),
                                    blurRadius: 12,
                                    color: AppColors.tempColor1.withOpacity(0.25)
                                )
                              ],
                              gradient: LinearGradient(
                                  colors: [
                                    AppColors.tempColor1,AppColors.tempColor2
                                  ]
                              ),
                              border: Border.all(color: AppColors.grayBorder.withOpacity(0.5), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Field(info: 'Coordinates ',
                                  info_image: 'location.png',
                                  value: get_coord(19.23,38.2), fontsize: 20,),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(6,6),
                                    blurRadius: 12,
                                    color: AppColors.tempColor2.withOpacity(0.5)
                                ),
                                BoxShadow(
                                    offset: Offset(-6,-6),
                                    blurRadius: 12,
                                    color: AppColors.tempColor1.withOpacity(0.25)
                                )
                              ],
                              gradient: LinearGradient(
                                  colors: [
                                    AppColors.tempColor1,AppColors.tempColor2
                                  ]
                              ),
                              border: Border.all(color: AppColors.grayBorder.withOpacity(0.5), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Field(info: 'Wind ', info_image: 'wind-power.png',
                                  value: "${23.toString()} km/hr",fontsize: 25,),
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
      ),
    );
  }
}
