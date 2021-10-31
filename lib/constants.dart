import 'package:flutter/material.dart';

import 'colors.dart';

class Constants {
  Constants._();
  static const baseUrl = 'http://45.144.179.101/scare-me/api/mobile/';

  static const defaultToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmYjUyOGZlZi1iYjY3LTQzNjMtYWU4Ni0wM2JjZTA5YWY3YTAiLCJpc3MiOiJodHRwOi8vMC4wLjAuMDo4MDgwIiwiZXhwIjoxNjM1Njk0Njk5LCJ1c2VyIjoiZmI1MjhmZWYtYmI2Ny00MzYzLWFlODYtMDNiY2UwOWFmN2EwIn0.b430zGtM8wHUSFCkMQ185yxLkHD3pkK6GhHKs0VCHFg';
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
