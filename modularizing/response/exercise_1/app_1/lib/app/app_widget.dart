import 'package:financial_module_1/financial_module_1.dart';
import 'package:flutter/material.dart';
import 'package:rh_module_1/rh_module_1.dart';

import 'pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/rh': (context) => const RhPage(),
        '/financial': (context) => const FinancialPage(),
      },
    );
  }
}
