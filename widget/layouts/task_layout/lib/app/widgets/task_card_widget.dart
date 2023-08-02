import 'package:flutter/material.dart';

import '../themes/color_extension.dart';

class TaskCardWidget extends StatefulWidget {
  const TaskCardWidget({super.key});

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  bool isChecked = false;

  late final theme = Theme.of(context);
  late final colors = theme.extension<ColorExtension>()!;

  void toggle() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  Color get cardColor {
    if (isChecked) return colors.taskCardSelected;
    return theme.cardColor;
  }

  Color get imageCardColor {
    if (isChecked) return colors.taskImageCardSelected;
    return theme.scaffoldBackgroundColor;
  }

  Color? get textColor {
    if (isChecked) return colors.taskTextSelected;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Card(
              color: imageCardColor,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.add),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Task',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: textColor,
                ),
              ),
            ),
            Checkbox.adaptive(
              value: isChecked,
              onChanged: (_) => toggle(),
              activeColor: theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
