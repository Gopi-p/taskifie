import 'package:flutter/material.dart';

class TextStyles {
  static const textScaleFactorBig = 1.1320;

  static TextStyle display2Xl = const TextStyle(
    fontSize: 72 * textScaleFactorBig,
    letterSpacing: 0.8,
    color: Color(0xFF1F1F1F),
  );

  static TextStyle displayXl = const TextStyle(
    fontSize: 60 * textScaleFactorBig,
    letterSpacing: 0.8,
    color: Color(0xFF1F1F1F),
  );

  static TextStyle displayLg = const TextStyle(
    fontSize: 48 * textScaleFactorBig,
    letterSpacing: 0.8,
    color: Color(0xFF1F1F1F),
  );

  static TextStyle displayMd = const TextStyle(
    fontSize: 36 * textScaleFactorBig,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: Color(0xFF1F1F1F),
  );

  static TextStyle displaySm = const TextStyle(
    fontSize: 30 * textScaleFactorBig,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: Color(0xFF1F1F1F),
  );

  static TextStyle displayXs = const TextStyle(
    fontSize: 24 * textScaleFactorBig,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: Color(0xFF1F1F1F),
  );

  static const TextStyle textXl = TextStyle(
    fontSize: 20 * textScaleFactorBig,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: Color(0xFF1F1F1F),
  );

  static const TextStyle textLg = TextStyle(
    fontSize: 18 * textScaleFactorBig,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1F1F1F),
  );

  static const TextStyle textMd = TextStyle(
    fontSize: 16 * textScaleFactorBig,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1F1F1F),
  );

  static const TextStyle textSm = TextStyle(
    fontSize: 14 * textScaleFactorBig,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1F1F1F),
  );

  static const TextStyle textXs = TextStyle(
    fontSize: 12 * textScaleFactorBig,
    fontWeight: FontWeight.w500,
    color: Color(0xFF595959),
  );

  static const TextStyle caption = TextStyle(
    fontSize: 10 * textScaleFactorBig,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1F1F1F),
  );
}
