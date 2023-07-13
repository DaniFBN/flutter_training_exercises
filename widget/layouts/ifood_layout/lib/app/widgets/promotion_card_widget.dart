import 'package:flutter/material.dart';

class PromotionCardWidget extends StatelessWidget {
  const PromotionCardWidget({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      height: size.width * 0.35,
      width: size.width * 0.8,
    );
  }
}
