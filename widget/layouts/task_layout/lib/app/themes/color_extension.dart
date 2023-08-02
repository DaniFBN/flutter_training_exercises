// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color percentageBackground;
  final Color calendarCurrentDay;
  final Color calendarCurrentDayBorder;
  final Color calendarTodayText;
  final Color taskCardSelected;
  final Color taskImageCardSelected;
  final Color taskTextSelected;

  ColorExtension({
    required this.percentageBackground,
    required this.calendarCurrentDay,
    required this.calendarCurrentDayBorder,
    required this.calendarTodayText,
    required this.taskCardSelected,
    required this.taskImageCardSelected,
    required this.taskTextSelected,
  });

  @override
  ThemeExtension<ColorExtension> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ColorExtension> lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
