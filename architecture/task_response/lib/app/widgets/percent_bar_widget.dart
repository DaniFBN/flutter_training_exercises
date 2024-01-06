import 'package:flutter/material.dart';

import '../themes/color_extension.dart';

class PercentBarWidget extends StatelessWidget {
  const PercentBarWidget({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<ColorExtension>()!;

    return LayoutBuilder(
      builder: (_, constraints) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          child: Stack(
            children: [
              Container(
                color: colors.percentageBackground,
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
