import 'package:flutter/material.dart';

import 'colors.dart';

class Constants {
  Constants._();
  static const baseUrl = 'http://45.144.179.101/scare-me/api/mobile/';

  static const defaultToken = '';
}

//FONTS
const kBaseTextStyle = TextStyle(
  fontFamily: 'Baloo Paaji',
  fontWeight: FontWeight.w600,
);

final kH1TextStyle = kBaseTextStyle.copyWith(
  fontSize: 38,
  fontWeight: FontWeight.w800,
);

final kH3TextStyle = kBaseTextStyle.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const kInputDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.white,
  ),
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
);

const kShadowScarryGlow = [
  BoxShadow(
    color: ScarryColors.orange,
    blurRadius: 10,
  )
];
