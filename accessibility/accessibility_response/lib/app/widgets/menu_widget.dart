import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: theme.textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            semanticsLabel: 'See All $title',
          ),
        ),
      ],
    );
  }
}
