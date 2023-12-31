import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool showArrow;

  const TitleSectionWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.showArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: theme.textTheme.titleMedium),
          ),
          if (showArrow)
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            )
        ],
      ),
    );
  }
}
