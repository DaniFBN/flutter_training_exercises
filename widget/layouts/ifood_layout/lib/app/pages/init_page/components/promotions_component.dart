import 'package:flutter/material.dart';

import '../../../widgets/promotion_card_widget.dart';

class PromotionsComponent extends StatelessWidget {
  const PromotionsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(width: 20),
                itemBuilder: (_, index) {
                  return PromotionCardWidget(
                    color: Colors.purple.shade200,
                    width: constraints.maxWidth * 0.9,
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            const Text('Buttons'),
          ],
        );
      },
    );
  }
}
