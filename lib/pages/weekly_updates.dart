
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/functioning/get_hourly_api.dart';
import 'package:weather_forecast/functioning/get_weekly.dart';
import 'package:weather_forecast/pages/page1.dart';
import 'package:weather_forecast/widgets/hourly_field.dart';
import 'package:weather_forecast/widgets/weekly_field.dart';


class Weekly extends StatefulWidget {
  const Weekly({Key? key}) : super(key: key);

  @override
  _WeeklyState createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  late Future<List<WeeklyField>> weeklyDataFuture;
  late Future<List<HourlyField>> hourlyDataFuture;

  @override
  void initState() {
    super.initState();
    weeklyDataFuture = getWeeklyData(city_getter());
    hourlyDataFuture = getdata();
  }

  @override

  //final response = http.get(Uri.parse(weekly_url));

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.location_on_outlined,color: Colors.white,),
                const SizedBox(width: 10,),
                Text(city_getter().toPascalCase(),
                  style: const TextStyle(color: Colors.blueAccent,
                      fontSize: 35,
                      fontFamily: "Cormorant",
                  fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 25,),
            const Text("Current",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Crimson',
                fontSize: 25
            ),),
            //AssetImage('assets/icons/display/sun.png'),
            FutureBuilder<List<HourlyField>>(
              future: hourlyDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return snapshot.data![index];
                      },
                    ),
                  );
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 15, 8,5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Next Forecast",style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Crimson',
                    fontSize: 30
                  ),),
                  Icon(Icons.calendar_month_sharp,color: Colors.white,size: 30,)

                ],
              ),
            ),
            FutureBuilder<List<WeeklyField>>(
              future: weeklyDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return snapshot.data![index];
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
