
import 'package:flutter/material.dart';
import 'package:weather_forecast/functioning/get_formatted_text.dart';
import 'package:weather_forecast/functioning/get_icon.dart';

class HourlyField extends StatefulWidget {
  final String date;
  final String condition;
  final double avg_temp_in_c;

  const HourlyField({
    Key? key,
    required this.date,
    required this.condition,
    required this.avg_temp_in_c,
  }) : super(key: key);

  @override
  State<HourlyField> createState() => _HourlyFieldState();
}

class _HourlyFieldState extends State<HourlyField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      width: 120,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue,width: 1),
          borderRadius: BorderRadius.circular(30),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 3, 0, 0),
                    child: Text("${widget.avg_temp_in_c.toString()} ",
                      style: const TextStyle(color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Crimson',
                      ),),
                  ),
                  SizedBox(height: 25, width: 25,
                        child: Image.asset('assets/icons/celsius.png'),)

                ],
              ),
            ),
            Text(get_formatted_text(widget.condition) ,
                textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.blue,fontSize: 25,fontFamily: 'Crimson'),),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: SizedBox(
                width: 50,height: 50,
                  child: Image.asset('assets/icons/display/${get_icon(widget.condition)}',)),
            ),
            Text(widget.date.substring(widget.date.length-5),
            style: const TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Crimson'),)
          ],
        ),
      ),
    );
  }
}
