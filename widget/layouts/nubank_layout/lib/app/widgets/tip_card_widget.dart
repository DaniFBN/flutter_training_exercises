import 'package:flutter/material.dart';

import '../data/mock.dart';

class TipCardWidget extends StatelessWidget {
  final TipItem tip;

  const TipCardWidget({
    Key? key,
    required this.tip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width * 0.7,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Center(
            child: Text.rich(
              TextSpan(
                children: tip.tips.map<InlineSpan>((tip) {
                  return TextSpan(
                    text: tip.text,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: tip.isSpecial ? theme.primaryColor : null,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
