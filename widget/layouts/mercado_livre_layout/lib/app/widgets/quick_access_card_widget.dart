import 'package:flutter/material.dart';
import 'package:mercado_livre_layout/app/utils/app_mocks.dart';

class QuickAccessCardWidget extends StatelessWidget {
  const QuickAccessCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5000)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5000)),
            child: Image.network(
              AppMocks.danImage,
              width: size.width * 0.14,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text('Item 1'),
        ),
      ],
    );
  }
}
