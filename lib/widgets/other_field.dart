import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String info,info_image;
  //final Image info_image;
  final int value;
  const Field({super.key, required this.info, required this.info_image, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(info, style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 20,
                  fontFamily: "Crimson"

              ),),
              Container(height: 25, width: 25,
                child: Image.asset('assets/icons/$info_image'),)
            ],

          ),
        ),
        Text(value.toString(), style: TextStyle(
            color: Color.fromRGBO(203, 195, 227, 1),
            fontSize: 20
        ))

      ],
    );
  }
}
