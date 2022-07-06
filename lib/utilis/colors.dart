// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const Map<int, Color> _primaryColor = {
  50: Color(0xff4BAD60),
  100: Color(0xff4BAD60),
  200: Color(0xff4BAD60),
  300: Color(0xff4BAD60),
  400: Color(0xff4BAD60),
  500: Color(0xff4BAD60),
  600: Color(0xff4BAD60),
  700: Color(0xff4BAD60),
  800: Color(0xff4BAD60),
  900: Color(0xff4BAD60),
};
const MaterialColor kPrimaryColor = MaterialColor(0xff4BAD60, _primaryColor);

Map<int, Color> _textColor = {
  50: Color(0xff141414).withOpacity(0.1),
  100: Color(0xff141414).withOpacity(0.2),
  200: Color(0xff141414).withOpacity(0.3),
  300: Color(0xff141414).withOpacity(0.4),
  400: Color(0xff141414).withOpacity(0.5),
  500: Color(0xff141414).withOpacity(0.6),
  600: Color(0xff141414).withOpacity(0.7),
  700: Color(0xff141414).withOpacity(0.8),
  800: Color(0xff141414).withOpacity(0.9),
  900: Color(0xff141414),
};
final MaterialColor kTextColor = MaterialColor(0xff141414, _textColor);
