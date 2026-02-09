import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_forecast/functioning/get_date_for_weekly.dart';
import 'dart:convert';

import 'package:weather_forecast/functioning/get_icon.dart';

class WeeklyField extends StatefulWidget {
  final String date,condition;
  final int index,humidity;
  final double avg_temp_in_c, avg_temp_in_f;
  const WeeklyField({super.key, required this.date,
    required this.condition, required this.index,
    required this.humidity, required this.avg_temp_in_c, required this.avg_temp_in_f});

  @override
  State<WeeklyField> createState() => _WeeklyFieldState();
}

class _WeeklyFieldState extends State<WeeklyField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all()
      ),
      height:  MediaQuery.of(context).size.height / 8,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8,0, 8),
        child: ListTile(
            contentPadding: EdgeInsets.zero,
          leading: Padding(
            //padding: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.fromLTRB(5, 15, 10,0),
            child: Text(get_StringDate(widget.date),style: TextStyle(color: Colors.white,
                fontSize: 20)),
          ),
          trailing: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Container(
                child: Image.asset('assets/icons/display/${get_icon(widget.condition)}',)),
          ),
          title: Text(widget.condition,
            style: TextStyle(color: Colors.blue[700],
            fontSize: 20),),
          subtitle:Row(
            children: [
              Text("${widget.humidity.toString()}%", style: TextStyle(color: Colors.white,
                  fontSize: 18)),
              Container(height: 20, width: 20,
                child: Image.asset('assets/icons/humidity.png'),),
              SizedBox(width: 20,),
              Text("${widget.avg_temp_in_c.toString()} ",style: TextStyle(color: Colors.white,
                  fontSize: 18)),
              Container(height: 15, width: 15,
                child: Image.asset('assets/icons/celsius.png'),),
              SizedBox(width: 20,),
              Text("${widget.avg_temp_in_f.toString()} ",style: TextStyle(color: Colors.white,
                  fontSize: 18)),
              Container(height: 15, width: 15,
                child: Image.asset('assets/icons/fahrenheit.png'),)
            ],
          ) ,

        ),
      ),
    );

  }
}

