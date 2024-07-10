import 'package:http/http.dart' as http;
import 'dart:convert';



Future<void> fetchWeatherData1({required String city}) async {
  try {
    //String city = 'london';
    String second_url = "http://api.weatherapi.com/v1/current.json?key=d771530ea2c04342a4a114808240807&q=$city";

    final second_response = await http.get(Uri.parse(second_url));

    if (second_response.statusCode == 200) {
      print("Connection Success for WeatherAPI.com");
      var decodedData1 = jsonDecode(second_response.body);
      String country = decodedData1["location"]["country"];
      String main_cond = decodedData1['current']['condition']['text'];
      double lat = decodedData1["location"]["lat"];
      double lon = decodedData1["location"]["lon"];
      double temp_in_c = decodedData1['current']['temp_c'];
      double temp_in_f = decodedData1['current']['temp_f'];
      double wind_mph = decodedData1['current']['wind_mph'];
      double pressure_mb = decodedData1['current']['pressure_mb'];
      int humidity = decodedData1['current']['humidity'];
    }
  }
  catch (e) {
    print('Error: $e');
  }
}