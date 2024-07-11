
import 'package:flutter/material.dart';
import 'package:weather_forecast/functioning/get_weekly.dart';
import 'package:weather_forecast/pages/page1.dart';
import 'package:weather_forecast/widgets/weekly_field.dart';

class Weekly extends StatefulWidget {
  const Weekly({Key? key}) : super(key: key);

  @override
  _WeeklyState createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  late Future<List<WeeklyField>> weeklyDataFuture;

  @override
  void initState() {
    super.initState();
    weeklyDataFuture = getWeeklyData(city_getter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(width: 200,height: 200,color: Colors.greenAccent,),
            FutureBuilder<List<WeeklyField>>(
              future: weeklyDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
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
