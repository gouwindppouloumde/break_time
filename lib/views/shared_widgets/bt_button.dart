import 'package:flutter/material.dart';

class BtButton extends ElevatedButton {
  BtButton(
      {required String title,
      FontWeight fontWeight = FontWeight.normal,
      backColor = Colors.redAccent,
      textColor = Colors.white,
      double fontSize = 12,
      double elevation = 0.0,
      double radius = 0.0,
      borderColor = Colors.transparent,
      borderWidth = 0.0,
      required double height,
      required double width,
      required void Function() onPressed,
      Key? key})
      : super(
            onPressed: onPressed,
            child: Text(title),
            key: key,
            style: ElevatedButton.styleFrom(
                side: BorderSide(color: borderColor, width: borderWidth),
                primary: backColor,
                onPrimary: textColor,
                elevation: elevation,
                fixedSize: Size(width, height),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius)),
                textStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                )));
}
