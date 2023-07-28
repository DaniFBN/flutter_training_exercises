import 'package:flutter/material.dart';


class CardGroupWidget extends StatelessWidget {
  const CardGroupWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: '$subtitle $title',
      excludeSemantics: true,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          color: theme.cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Card(
                  color: theme.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: theme.primaryIconTheme.color,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
