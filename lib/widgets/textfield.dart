import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  final String description_text;
  final TextEditingController controller;
  Field({super.key, required this.description_text, required this.controller});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          SizedBox(height: MediaQuery.of(context).size.height *0.03,),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.description_text,
                style: TextStyle(),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
          ),
        ],
      ),
    );
  }
}