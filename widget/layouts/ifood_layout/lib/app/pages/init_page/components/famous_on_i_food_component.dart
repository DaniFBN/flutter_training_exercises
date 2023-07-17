import 'package:flutter/material.dart';

import '../../../utils/mocks.dart';
import '../../../widgets/category_name_widget.dart';
import '../../../widgets/last_restaurant_card_widget.dart';

class FamousOnIFoodComponent extends StatelessWidget {
  const FamousOnIFoodComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: CategoryNameWidget(
            name: 'Famosos no iFood',
            onTap: () {},
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            itemCount: 8,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, index) {
              return SizedBox(
                width: size.width * .2,
                child: LastRestaurantCardWidget(
                  imageUrl: AppMocks.fTeamImage,
                  name: 'Item asas asasas$index',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
