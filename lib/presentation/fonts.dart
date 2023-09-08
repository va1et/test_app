import 'package:flutter/material.dart';

abstract class LightTextTheme {
  static const appBar = TextStyle(
    fontSize: 18,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    
  );
  static const xLargeTitleMS = TextStyle(
     decoration: TextDecoration.none,
    fontSize: 30,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
  );
  static const smallabout = TextStyle(
    fontSize: 14,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
  );
  static const pin = TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
  );
  static const text = TextStyle(
    fontSize: 16,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
  );
  static const smalllabel = TextStyle(
    fontSize: 12,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );
  static const expansionButton = TextStyle(
    fontSize: 22,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
  );
}
