import 'dart:io';

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget web;
  final Widget android;
  final Widget iOS;
  final Widget iPad;
  final Widget tablet;

  const ResponsiveLayout({
    Key? key,
    required this.web,
    required this.android,
    required this.iOS,
    required this.iPad,
    required this.tablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final isIos = Platform.isIOS;

    if (size.width < 600) {
      if (isIos) return iOS;
      return android;
    } else if (size.width < 1200) {
      if (isIos) return iPad;
      return tablet;
    } else {
      return web;
    }
  }
}
