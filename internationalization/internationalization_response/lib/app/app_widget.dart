import 'package:flutter/material.dart';

import 'l10n/gen/app_localizations.dart';
import 'pages/home_page.dart';
import 'theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showSemanticsDebugger: true,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('pt'),
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}

