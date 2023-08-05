import 'package:flutter/material.dart';
import 'package:styling_response/pages/home/home_android_page.dart';
import 'package:styling_response/pages/home/home_ios_page.dart';
import 'package:styling_response/pages/home/home_ipad_page.dart';
import 'package:styling_response/pages/home/home_tablet_page.dart';
import 'package:styling_response/pages/home/home_web_page.dart';
import 'package:styling_response/widgets/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      web: HomeWebPage(),
      android: HomeAndroidPage(),
      iOS: HomeIosPage(),
      iPad: HomeIPadPage(),
      tablet: HomeTabletPage(),
    );
  }
}
