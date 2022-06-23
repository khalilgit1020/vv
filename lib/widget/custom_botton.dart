import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback OnPressed;
  var Myicon;
  CustomBotton({required this.color, required this.text,required this.OnPressed, this.Myicon}){}


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: color,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: OnPressed,
        minWidth: double.infinity,
        height: 42,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(width: 4,),
            Icon(Myicon,color: Colors.white,size: 16,)
          ],
        ),
      ),
    );
  }
}