import 'package:flutter/material.dart';

class BtOutlinedButton extends OutlinedButton {
  BtOutlinedButton({
    Key? key,
    required String title,
    required VoidCallback onPressed,
    Color borderColor = Colors.white,
    String fontFamily = 'Ubuntu',
    Color textColor = Colors.redAccent,
    double fontSize = 18.0,
    FontWeight fontWeight = FontWeight.bold,
    double radius = 10.0,
  }) : super(
          key: key,
          child: Text(title),
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            primary: textColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor, width: 5.0),
                borderRadius: BorderRadius.circular(radius)),
            textStyle: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
            ),
          ),
        );
}
