import 'package:flutter/material.dart';
import 'package:task_layout/app/widgets/percent_bar_widget.dart';

class RoutineCardWidget extends StatelessWidget {
  const RoutineCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.sunny),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Morning Routine'),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Progress'),
                  Text(
                    '60%',
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.primaryColor, fontWeight: FontWeight.w500),
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
