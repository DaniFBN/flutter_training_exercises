import 'package:flutter/material.dart';

class CategoryNameWidget extends StatelessWidget {
  const CategoryNameWidget({
    Key? key,
    required this.name,
    this.onTap,
  }) : super(key: key);

  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium!.copyWith(fontSize: 18),
          ),
        ),
        if (onTap != null)
          TextButton(
            onPressed: onTap,
            child: Text(
              'Ver mais',
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
