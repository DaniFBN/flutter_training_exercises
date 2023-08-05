import 'package:flutter/material.dart';

class HomeIPadPage extends StatelessWidget {
  const HomeIPadPage({super.key});

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
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: colors.length,
              itemBuilder: (_, index) {
                return Container(
                  width: 100,
                  color: colors[index],
                  child: const Text('iPad'),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: colors.length,
              itemBuilder: (_, index) {
                return Container(
                  width: 100,
                  color: colors[index],
                  child: const Text('iPad'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
