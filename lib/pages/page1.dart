import 'package:flutter/material.dart';
import 'package:weather_forecast/functioning/country_data.dart';
import 'package:weather_forecast/functioning/get_date.dart';
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
  String country_code='';
  double temp=0,longitude=0,wind=0;
  int humidity=0, pressure=0;


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
      String second_url= "http://api.weatherapi.com/v1/current.json?key=d771530ea2c04342a4a114808240807&q=$city";

      final response = await http.get(Uri.parse(finalUrl));
      final second_response = await http.get(Uri.parse(second_url));

      if(second_response.statusCode==200){
        //print("Connection Success for second");
        // String data1 = second_response.body;
        // var decodedData1 = jsonDecode(data1);

        print("Connection Success for WeatherAPI.com");
        var decodedData1 = jsonDecode(second_response.body);
        String country = decodedData1["location"]["country"];
        String main_cond= decodedData1['current']['condition']['text'];
        double lat= decodedData1["location"]["lat"];
        double lon= decodedData1["location"]["lon"];
        double temp_in_c= decodedData1['current']['temp_c'];
        double temp_in_f= decodedData1['current']['temp_f'];
        double wind_mph= decodedData1['current']['wind_mph'];
        int pressure_mb= decodedData1['current']['pressure_mb'];
        int humidity= decodedData1['current']['pressure_mb'];


        print(country);
        print(main_cond);
        print(lat);
        print(lon);
        print(temp_in_c);
        print(temp_in_f);
        print(wind_mph);
        print(pressure_mb);
        print(humidity);


        //String country = decodedData1["location"]["country"];

        //print(country);


      }

      if (response.statusCode == 200) {
        print("Successful Connection");
        String data = response.body;
        var decodedData = jsonDecode(data);
        setState(() {
        temp= decodedData['main']['temp'];
        humidity= decodedData['main']['humidity'];
        pressure= decodedData['main']['pressure'];
        main_condition= decodedData['weather'][0]['main'];
        longitude = decodedData['coord']['lon'];
        country_code= decodedData['sys']['country'];
        wind= decodedData["wind"]["speed"];
        });

        // print(main_condition);
        // print(country_code);
        // print(wind);

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
          //Field(description_text: 'Enter your Name', controller: nameController),
          Field(description_text: "Enter your city",controller: cityController,),
          SizedBox(height: MediaQuery.of(context).size.height *0.03,),
          ElevatedButton(onPressed: (){
            fetchWeatherData();
            Navigator.of(context).push
              (MaterialPageRoute(
                builder: (context)=>Page2(temp: temp, humidity: humidity,
                    pressure: pressure, main_condition: main_condition),
            ));
          }, child: Text("Search")),
          //Text(get_coord(longitude)),
          // Text(get_coord(longitude).toString())
        ],
      ),
    );
  }
}
