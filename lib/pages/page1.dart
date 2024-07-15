
import 'package:flutter/material.dart';
import 'package:weather_forecast/pages/page2.dart';
import 'package:weather_forecast/widgets/textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API_KEY = '28792283d0791c289411e6c81fad5c11';

TextEditingController cityController = TextEditingController();

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String? main_condition, country;
  double? temp_in_c, temp_in_f, lat, lon, wind_mph, pressure_mb;
  int? humidity;
  TextEditingController nameController = TextEditingController();
  bool showWeatherDetails = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchWeatherData1({required String city}) async {
    try {
      String second_url =
          "http://api.weatherapi.com/v1/current.json?key=d771530ea2c04342a4a114808240807&q=$city";
      final second_response = await http.get(Uri.parse(second_url));

      if (second_response.statusCode == 200) {
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
          showWeatherDetails = true;
        });
      } else {
        //print("Error: ${second_response.statusCode}");
        setState(() {
          showWeatherDetails = false;
        });
      }
    } catch (e) {
      //print('Error: $e');
      setState(() {
        showWeatherDetails = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String city = cityController.text;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Field(description_text: 'Enter your Name', controller: nameController),
          Field(description_text: "Enter your city", controller: cityController),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ElevatedButton(
            onPressed: () async {
              await fetchWeatherData1(city: city);
              if (showWeatherDetails) {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Page2(
                        lat: lat ?? 0.0,
                        lon: lon ?? 0.0,
                        temp_in_c: temp_in_c ?? 0.0,
                        temp_in_f: temp_in_f ?? 0.0,
                        wind_mph: wind_mph ?? 0.0,
                        pressure_mb: pressure_mb ?? 0.0,
                        humidity: humidity ?? 0,
                        city: city,
                        country: country ?? '',
                        main_condition: main_condition ?? '',
                        username: nameController.text,
                      ),
                    ),
                  );
                });
              }
            },
            child: const Text("Search"),
          ),
          if (!showWeatherDetails)
            // AlertDialog(
            //   title: const Text("Incorrect Place Entered.... Try Again",
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 30,
            //           fontFamily: "Cormorant",
            //         fontWeight: FontWeight.bold)),
            //   backgroundColor: Colors.blue[700],
            //   elevation: 25,
            //
            // ),
            Center(
              child: Container(
                //color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.25,
                //color: Colors.blue,
                child: const Text("Incorrect Place Entered.... Try Again",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "Cormorant"
                ),),
              ),
            ),
        ],
      ),
    );
  }
}

String city_getter(){
  return cityController.text;
}