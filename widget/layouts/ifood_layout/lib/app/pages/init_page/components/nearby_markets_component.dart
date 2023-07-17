import 'package:flutter/material.dart';

import '../../../widgets/category_name_widget.dart';
import '../../../widgets/restaurant_card_widget.dart';

class NearbyMarketsComponent extends StatelessWidget {
  const NearbyMarketsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: CategoryNameWidget(
            name: 'Mercados próximo a você',
            onTap: () {},
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: GridView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.35,
              mainAxisSpacing: 28,
            ),
            itemBuilder: (_, __) {
              return const RestaurantCardWidget(
                width: 0,
              );
            },
          ),
        ),
      ],
    );
  }
}
