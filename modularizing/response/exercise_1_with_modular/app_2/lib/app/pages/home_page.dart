import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/rh2/'),
              child: const Text('RH'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/rh2/detail'),
              child: const Text('RH Detail'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/rh/person/'),
              child: const Text('Person'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed(
                AppRoutes.financialPageFullRoute,
              ),
              child: const Text('Financial'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppRoutes {
  static const financialRoute = '/financial';
  static const financialPageRoute = '/';
  static const financialPageFullRoute = financialRoute + financialPageRoute;
}
