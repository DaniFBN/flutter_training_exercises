import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../themes/color_extension.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime focusedDay = DateTime.now();

  void changeDay(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.focusedDay = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<ColorExtension>()!;

    return TableCalendar(
      currentDay: DateTime.now(),
      focusedDay: focusedDay,
      firstDay: DateTime.now().subtract(const Duration(days: 30)),
      lastDay: DateTime.now().add(const Duration(days: 30)),
      onDaySelected: changeDay,
      selectedDayPredicate: (day) => isSameDay(day, focusedDay),
      rowHeight: 40,
      calendarStyle: CalendarStyle(
        todayTextStyle: TextStyle(color: colors.calendarTodayText),
        todayDecoration: BoxDecoration(
          color: colors.calendarCurrentDay,
          shape: BoxShape.circle,
          border: Border.all(color: colors.calendarCurrentDayBorder),
        ),
        selectedDecoration: BoxDecoration(
          color: theme.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
