import 'package:flutter/material.dart';

TextStyle titleStyle() {
  return textStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
}

TextStyle textStyle({fontSize = 14.0, color = Colors.black, fontWeight = FontWeight.normal}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}
