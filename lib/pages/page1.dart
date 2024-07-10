import 'package:flutter/material.dart';
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

  String? main_condition,country;
  double? temp_in_c,temp_in_f ,lat,lon,wind_mph,pressure_mb;
  int? humidity;


  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchWeatherData1({required String city}) async {
    try {
      //String city = 'london';
      String second_url = "http://api.weatherapi.com/v1/current.json?key=d771530ea2c04342a4a114808240807&q=$city";

      final second_response = await http.get(Uri.parse(second_url));

      if (second_response.statusCode == 200) {
        print("Connection Success for WeatherAPI.com");
        var decodedData1 = jsonDecode(second_response.body);
        setState(() {
          country = decodedData1["location"]["country"];
          main_condition = decodedData1['current']['condition']['text'];
          lat = decodedData1["location"]["lat"];
          lon = decodedData1["location"]["lon"];
          temp_in_c = decodedData1['current']['temp_c'];
          temp_in_f = decodedData1['current']['temp_f'];
          wind_mph = decodedData1['current']['wind_kph'];
          pressure_mb = decodedData1['current']['pressure_mb'];
          humidity = decodedData1['current']['humidity'];
        });


      }
    }
    catch (e) {
      print('Error: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    String city= cityController.text;
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
          ElevatedButton(onPressed: ()async{
            //fetchWeatherData();
            await fetchWeatherData1(city: city);
            Navigator.of(context).push
              (MaterialPageRoute(
              builder: (context)=> Page2(lat: lat ?? 0.0, lon: lon ?? 0.0,
                    temp_in_c: temp_in_c ?? 0.0, temp_in_f: temp_in_f ?? 0.0,
                    wind_mph: wind_mph ?? 0.0, pressure_mb: pressure_mb ?? 0.0,
                    humidity: humidity ?? 0, city: city,
                    country: country ?? 'Unavailable', main_condition: main_condition ?? 'Unavailable',
                username: nameController.text,),
            ));
          }, child: Text("Search")),
          //Text(get_coord(longitude)),
          // Text(get_coord(longitude).toString())
        ],
      ),
    );
  }
}
