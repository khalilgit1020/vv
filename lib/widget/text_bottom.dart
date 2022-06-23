import 'package:flutter/material.dart';

class TextBottom extends StatelessWidget {
  final String text;
  final Color color;
  final Alignment alignment;
  final VoidCallback OnPressed;
  final double fontsize;
  final FontWeight fontWeight;
  TextBottom({required this.text, required this.color, required this.alignment, required this.OnPressed, required this.fontsize,required this.fontWeight}){}

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: TextButton(
            onPressed: OnPressed,
            child: Text(
              text,
              style: TextStyle(color: color,fontSize: fontsize,fontWeight:fontWeight),
            )));
  }
}
