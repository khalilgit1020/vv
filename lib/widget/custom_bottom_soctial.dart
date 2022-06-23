import 'package:flutter/material.dart';

class CustomBottomSoctial extends StatelessWidget {

  final String text;
  final String img;
  VoidCallback OnPressed;
  CustomBottomSoctial( {required this.text,required this.img,required this.OnPressed}){}

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        onPressed: OnPressed,
        minWidth: double.infinity,
        height: 42,
        child: Row(
          children: [
            Image(
              image: AssetImage(
                  img),
              height: 24,
              width: 24,
            ),
            SizedBox(
              width: 56,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
