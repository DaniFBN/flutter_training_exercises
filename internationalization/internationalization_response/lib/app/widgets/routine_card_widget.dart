import 'dart:math';

import 'package:flutter/material.dart';

import '../l10n/gen/app_localizations_extension.dart';
import 'percent_bar_widget.dart';

class RoutineCardWidget extends StatelessWidget {
  const RoutineCardWidget({
    super.key,
  });

  static const dailies = ['m', 'a', 'n'];

  @override
  Widget build(BuildContext context) {
    final dailyIndex = Random().nextInt(3);
    final daily = dailies.elementAt(dailyIndex);

    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              semanticContainer: false,
              color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.sunny),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(context.intl.dailyRoutine(daily)),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.intl.progress),
                  Text(
                    '60%',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const PercentBarWidget(percentage: 0.6),
          ],
        ),
      ),
    );
  }
}
