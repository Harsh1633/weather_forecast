import 'package:flutter/material.dart';
import 'package:weather_forecast/functioning/get_weather.dart';
import 'package:weather_forecast/pages/page2.dart';
import 'package:weather_forecast/widgets/textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const API_KEY = '28792283d0791c289411e6c81fad5c11';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  String temp_display= '';
  String humid_display='';
  String main_condition='';
  // double? temp,humidity;

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchWeatherData() async {
    try {
      String city= cityController.text;
      String finalUrl = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$API_KEY";
      final response = await http.get(Uri.parse(finalUrl));
      if (response.statusCode == 200) {
        print("Successful Connection");
        String data = response.body;
        var decodedData = jsonDecode(data);
        temp_display=  decodedData['main']['temp'].toString();
        humid_display = decodedData['main']['humidity'].toString();
        main_condition= decodedData['weather'][0]['main'];
        print(temp_display);
        print(humid_display);
        print(main_condition);

      } else {
        setState(() {
          temp_display= 'Failed to load weather data';
        });

      }
    } catch (e) {
      print('Error: $e');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Field(description_text: 'Enter your Name', controller: nameController),
          Field(description_text: "Enter your city",controller: cityController,),
          SizedBox(height: MediaQuery.of(context).size.height *0.03,),
          ElevatedButton(onPressed: (){
            fetchWeatherData();
            // Navigator.of(context).push
            //   (MaterialPageRoute(
            //     builder: (context)=> Page2()));
          }, child: Text("Search")),
          Text(humid_display),
          Text(temp_display),

          Text(main_condition),
        ],
      ),
    );
  }
}
