import 'package:flutter/material.dart';

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
              onPressed: () => Navigator.of(context).pushNamed('/rh'),
              child: const Text('RH'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/financial'),
              child: const Text('Financial'),
            ),
          ],
        ),
      ),
    );
  }
}
