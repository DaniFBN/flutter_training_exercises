import 'package:flutter/widgets.dart';

class RandomWidget extends StatelessWidget {
  const RandomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Tanto faz',
          key: ValueKey('tanto-faz'),
          semanticsLabel: 'Whatever',
        ),
        Text(
          'Tanto faz',
          key: ValueKey('tanto-faz2'),
        ),
      ],
    );
  }
}
