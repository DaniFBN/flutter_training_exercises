import 'package:flutter/material.dart';

import '../flavor/app_flavor.dart';
import '../services/i_app_version_service.dart';

class HomePage extends StatelessWidget {
  final IAppVersionService appVersionService;

  const HomePage({
    Key? key,
    required this.appVersionService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flavor Example')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Image.network(AppFlavor.client.name),
            ),
            Text(
              AppFlavor.client.name,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Environment: ${AppFlavor.env.name}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'ServerUrl: ${AppUrl.serverUrl}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<AppVersion>(
              valueListenable: appVersionService.version,
              builder: (_, appVersion, __) {
                final version = appVersion.version;
                final buildNumber = appVersion.buildNumber;
                final packageName = appVersion.packageName;
                final appName = appVersion.appName;

                return Column(
                  children: [
                    Text(
                      '$appName - v$version+$buildNumber',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      packageName,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
