import 'package:flutter/material.dart';

abstract final class AppSpacing {
  // Extra small
  static const double xs = 4;

  // Small
  static const double sm = 8;

  // Medium
  static const double md = 12;

  // Default
  static const double lg = 16;

  // Large
  static const double xl = 20;

  // Extra large
  static const double xxl = 24;

  // Huge
  static const double xxxl = 32;

  // Extra huge
  static const double huge = 40;

  // Section spacing
  static const double section = 48;

  // Screen horizontal padding
  static const double screenHorizontal = 20;

  // Screen vertical padding
  static const double screenVertical = 16;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontal,
    vertical: screenVertical,
  );

  // listPadding , bottomSheetPadding
  static const EdgeInsets listPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontal,
    vertical: screenVertical,
  );

  static const EdgeInsets bottomSheetPadding = EdgeInsets.symmetric(
    horizontal: screenHorizontal,
    vertical: screenVertical,
  );

  // cardPadding
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
}
