import 'package:flutter/material.dart';

class InfoField extends StatelessWidget {
  final String info,infoImage,value;
  final double? fontSize;

  const InfoField({super.key, required this.info, required this.infoImage,
    required this.value, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(info, style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 20,
                  fontFamily: "Crimson"

              ),),
              SizedBox(height: 25, width: 25,
                child: Image.asset('assets/icons/$infoImage'),)
            ],

          ),
        ),
        Text(value.toString(), style: TextStyle(
            color: Color.fromRGBO(203, 195, 227, 1),
            fontSize: fontSize
        ))

      ],
    );
  }
}
