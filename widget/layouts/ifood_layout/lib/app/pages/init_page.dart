import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Card(
                      elevation: 0,
                      color: Colors.grey.shade200,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://avatars.githubusercontent.com/u/54218517?v=4',
                        ),
                      ),
                    ),
                    Text('Item $index'),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
