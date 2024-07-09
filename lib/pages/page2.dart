import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast/functioning/get_date.dart';
import 'package:weather_forecast/functioning/get_weather.dart';
import 'package:weather_forecast/widgets/other_field.dart';
import 'package:weather_forecast/widgets/temp_field.dart';

class Page2 extends StatefulWidget {
  final double temp;
  final int humidity, pressure;
  final String main_condition;

  // city,country,latitude,longitude

  const Page2({super.key,
    required this.temp,
    required this.humidity,
    required this.pressure,
    required this.main_condition});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            "Hi Jared!!!! 😊",
            style: TextStyle(
                color: Colors.blue[700],
                fontSize: 25,
                fontFamily: "Crimson"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: Text(
            get_date(),
            style: TextStyle(
                color: Colors.blue[700],
                fontSize: 30,
                fontFamily: "Crimson"),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
            child: Center(
              child: Text(
                "Mumbai",
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cormorant"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          child: SizedBox(
            height: 120,
            child: OverflowBox(
              minHeight: 400,
              maxHeight: 400,
              child: Opacity(
                  opacity: 0.4,
                  child: Lottie.asset('assets/animations/sunny.json')),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Center(
            child: Text(
              widget.main_condition,
              style: TextStyle(color: Colors.blue[700],
                  fontSize: 30,
                  fontFamily: "Crimson"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  // blue border, 2 pixels wide
                  borderRadius: BorderRadius.circular(10), // rounded corners
                ),
                child: Row(
                  children: [
                    TempField(temp_unit: 'Kelvin', temp_value: widget.temp.toString(),),
                    TempField(temp_unit: '°Fahrenheit', temp_value: get_temp(widget.temp, 2),),
                    TempField(temp_unit: '°Celsius', temp_value: get_temp(widget.temp, 1),)
                  ],
                ),
              )
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.29,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Field(info: 'Wind ', info_image: 'wind-power.png', value: 310,),
                        Field(info: 'Humidity ', info_image: 'precipitation.png', value: widget.humidity,),
                        Field(info: 'Pressure ', info_image: 'pressure-gauge.png', value: widget.pressure,),
                      ],),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.29,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ABC")
                        ],
                      ),
                    ),
                  )
                ],
              ),),
        ),

    ],
    ),
    ),
    )
    );

  }
}
