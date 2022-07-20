import 'package:flutter/material.dart';

class BtTextWidget extends Text {
  BtTextWidget(
      {required String data,
      String fontFamily = 'Ubuntu',
      double fontSize = 18,
      Color fontColor = Colors.black,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.center,
      double interline = 1.1,
      Key? key})
      : super(data,
            textAlign: textAlign,
            style: TextStyle(
              fontWeight: fontWeight,
              color: fontColor,
              fontSize: fontSize,
              fontFamily: fontFamily,
              height: interline,
            ));
}
