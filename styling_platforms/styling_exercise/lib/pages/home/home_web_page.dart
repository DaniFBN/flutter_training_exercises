import 'package:flutter/material.dart';

class HomeWebPage extends StatelessWidget {
  const HomeWebPage({super.key});

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (_, index) {
                return Container(
                  width: 100,
                  color: colors[index],
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (_, index) {
                return Container(
                  width: 100,
                  color: colors[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
