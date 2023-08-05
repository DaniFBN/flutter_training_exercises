import 'package:flutter/material.dart';

class HomeAndroidPage extends StatelessWidget {
  const HomeAndroidPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.brown,
      Colors.white,
      Colors.indigo,
      Colors.lime,
      Colors.pink,
      Colors.teal,
      Colors.purple,
      Colors.cyan,
      Colors.yellow,
      Colors.amber,
      Colors.green,
      Colors.orange,
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (_, index) {
          return Container(
            height: 100,
            width: double.infinity,
            color: colors[index],
            child: const Text('Android'),
          );
        },
      ),
    );
  }
}
