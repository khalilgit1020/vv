import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFromFeild extends StatelessWidget {
  final String text;
  String entered;
  final Color color;
  final CrossAxisAlignment alignment;
  CustomTextFromFeild({required this.text,required this.color,required this.alignment,required this.entered, }){}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
        TextFormField(
          onChanged: (value) {
            entered=value;
          },
          decoration: InputDecoration(
            fillColor: color,

          ),
        ),
      ],
    );
  }
}