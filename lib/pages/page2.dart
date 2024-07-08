import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weather_forecast/functioning/get_date.dart';
import 'package:weather_forecast/functioning/get_weather.dart';

class Page2 extends StatefulWidget {
  final double temp;
  final int humidity, pressure;
  final String main_condition;

  const Page2(
      {super.key,
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
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Text(
        //     "Hi Jared",
        //     style: TextStyle(color: Colors.blue[700]),
        //   ),
        //   backgroundColor: Colors.black,
        // ),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                "Hi Jared",
                style: TextStyle(color: Colors.blue[700],fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                child: Text(
                  get_date(),
                  style: TextStyle(color: Colors.blue[700], fontSize: 20),
                ),
              )
            ],
          ),
        ));
    Column(
        // children: [
        //   // Text(widget.temp.toString()),
        //   // Text(get_temp(widget.temp,1)),
        //   // Text(get_temp(widget.temp, 2)),
        //   // Text(widget.humidity.toString()),
        //   // Text(widget.pressure.toString()),
        //   // Text(widget.main_condition),
        // ],
        );
  }
}
