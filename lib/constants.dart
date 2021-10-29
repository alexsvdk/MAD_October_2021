import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const baseUrl = 'https://jsonplaceholder.typicode.com/';
}

//FONTS
const kBaseTextStyle = TextStyle();

final kH1TextStyle = kBaseTextStyle.copyWith(
  fontSize: 40,
);

final kH3TextStyle = kBaseTextStyle.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
