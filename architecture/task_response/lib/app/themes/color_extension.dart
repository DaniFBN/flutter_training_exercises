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
  ThemeExtension<ColorExtension> lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    if (t < 0.5 || other == null) return this;
    return other;
  }

  @override
  ColorExtension copyWith({
    Color? percentageBackground,
    Color? calendarCurrentDay,
    Color? calendarCurrentDayBorder,
    Color? calendarTodayText,
    Color? taskCardSelected,
    Color? taskImageCardSelected,
    Color? taskTextSelected,
  }) {
    return ColorExtension(
      percentageBackground: percentageBackground ?? this.percentageBackground,
      calendarCurrentDay: calendarCurrentDay ?? this.calendarCurrentDay,
      calendarCurrentDayBorder:
          calendarCurrentDayBorder ?? this.calendarCurrentDayBorder,
      calendarTodayText: calendarTodayText ?? this.calendarTodayText,
      taskCardSelected: taskCardSelected ?? this.taskCardSelected,
      taskImageCardSelected:
          taskImageCardSelected ?? this.taskImageCardSelected,
      taskTextSelected: taskTextSelected ?? this.taskTextSelected,
    );
  }
}
