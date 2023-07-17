import 'package:flutter/material.dart';

class PromotionCardWidget extends StatelessWidget {
  const PromotionCardWidget({
    Key? key,
    required this.width,
    required this.color,
  }) : super(key: key);

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
