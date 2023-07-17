import 'package:flutter/material.dart';

class CircleDividerWidget extends StatelessWidget {
  const CircleDividerWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Text('\u2022', style: TextStyle(color: color)),
    );
  }
}
