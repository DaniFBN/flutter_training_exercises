import 'package:flutter/material.dart';

class PercentBarWidget extends StatelessWidget {
  const PercentBarWidget({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (_, constraints) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.black12,
                height: 6,
                width: constraints.maxWidth,
              ),
              Container(
                height: 6,
                width: constraints.maxWidth * percentage,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
