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
              onPressed: () => Modular.to.pushNamed('/rh/'),
              child: const Text('RH'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/rh/detail'),
              child: const Text('RH Detail'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/financial/'),
              child: const Text('Financial'),
            ),
          ],
        ),
      ),
    );
  }
}
