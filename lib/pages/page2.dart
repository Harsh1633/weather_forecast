
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_forecast/functioning/get_animation.dart';
import 'package:weather_forecast/functioning/get_coordinate.dart';
import 'package:weather_forecast/functioning/get_date.dart';
import 'package:weather_forecast/pages/weekly_updates.dart';
import 'package:weather_forecast/widgets/other_field.dart';
import 'package:weather_forecast/widgets/temp_field.dart';
import 'package:change_case/change_case.dart';

class Page2 extends StatefulWidget {

  final double lat,lon,temp_in_c,temp_in_f,wind_mph,pressure_mb;
  final int humidity;
  final String city,country,main_condition,username;


  const Page2({super.key, required this.lat, required this.lon,
    required this.temp_in_c, required this.temp_in_f,
    required this.wind_mph, required this.pressure_mb,
    required this.humidity, required this.city,
    required this.country, required this.main_condition, required this.username,});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
   double temp_in_k= double.parse((widget.temp_in_c + 273.15).toStringAsPrecision(5));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "Hi ${widget.username}!!!! 😊",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 25,
                              fontFamily: "Crimson"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Text(
                          getDate(date:now),
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 30,
                              fontFamily: "Crimson"),
                        ),
                      )
                    ],
                  ),
                 ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push
                          (MaterialPageRoute(
                            builder: (context)=> const Weekly()));
                      },
                     style: ButtonStyle(
                       backgroundColor: WidgetStateProperty.all<Color>(Colors.blue)
                     ),
                      child: const Text("Weekly",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),))
                ],
              )
        ,Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
          child: Center(
            child: Text(
              "${widget.city.toCapitalCase()}, ${widget.country}",
              style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 25,
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
                child: Lottie.asset('assets/animations/${getAnimation(widget.main_condition)}')),
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
                  TempField(temp_unit: '°Celsius', temp_value: widget.temp_in_c.toString()),
                  TempField(temp_unit: '°Fahrenheit', temp_value: widget.temp_in_f.toString()),
                  TempField(temp_unit: 'Kelvin', temp_value: temp_in_k.toString()),
                ],
              ),
            )
        ),
                ),
                Padding(
          padding: const EdgeInsets.all(8.0),
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
                    Field(info: 'Humidity ', info_image: 'precipitation.png',
                      value: "${widget.humidity.toString()} %",fontsize: 25,),
                    const SizedBox(height: 30,),
                    Field(info: 'Pressure ', info_image: 'pressure-gauge.png',
                      value: widget.pressure_mb.toString(),fontsize: 25,),
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
                        border: Border.all(color: Colors.blue,width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Field(info: 'Coordinates ',
                            info_image: 'location.png',
                            value: getCoord(widget.lat,widget.lon), fontsize: 20,),
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
                        border: Border.all(color: Colors.blue,width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Field(info: 'Wind ', info_image: 'wind-power.png',
                            value: "${widget.wind_mph.toString()} km/hr",fontsize: 25,),
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
    )
    );

  }
}
