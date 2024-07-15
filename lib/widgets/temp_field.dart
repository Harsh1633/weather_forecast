import 'package:flutter/material.dart';

class TempField extends StatelessWidget {
  final String temp_unit,temp_value;
  const TempField({super.key, required this.temp_unit, required this.temp_value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 60,
            decoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(10),
                color: Colors.black),
            child: TextButton(
              onPressed: () {},
              child: Text(
                temp_value,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          Text(temp_unit,
            style: TextStyle(
                color: Colors.blue[700],
                fontSize: 25,
                //fontWeight: FontWeight.bold,
            fontFamily: 'Crimson'),)
        ],
      ),
    );
  }
}
