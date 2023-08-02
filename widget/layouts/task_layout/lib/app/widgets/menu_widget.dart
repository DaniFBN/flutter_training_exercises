import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text('See All'),
        ),
      ],
    );
  }
}
