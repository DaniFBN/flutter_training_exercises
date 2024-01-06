import 'package:flavor_response/app/services/app_version_service.dart';
import 'package:flutter/material.dart';

import 'flavor/app_flavor.dart';
import 'pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${AppFlavor.client.name} [${AppFlavor.env.name}]',
      home: HomePage(
        appVersionService: AppVersionService(),
      ),
    );
  }
}
