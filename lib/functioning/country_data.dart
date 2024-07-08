
import 'package:http/http.dart' as http;
import 'dart:convert';

String REST_ENDPOINT= "https://restcountries.com/v3.1/alpha/";
String currency='';



Future<String> get_country_data(String country_code)async{
  REST_ENDPOINT= REST_ENDPOINT+country_code;
  final response = await http.get(Uri.parse(REST_ENDPOINT));
  if (response.statusCode == 200) {
    print("Successful Connection");
    String data = response.body;
    var decoded_country_data = jsonDecode(data);

    currency=decoded_country_data[0]['currencies']['GBP']['name'];

  }
  return currency;
  }