import 'package:flutter/material.dart';

import '../../../widgets/category_card_widget.dart';
import '../../../widgets/category_name_widget.dart';

class MoreIFoodComponent extends StatelessWidget {
  const MoreIFoodComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: CategoryNameWidget(
            name: 'Mais iFood pra você',
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return CategoryCardWidget(
                imageUrl:
                    'https://avatars.githubusercontent.com/u/54218517?v=4',
                title: 'Item $index',
              );
            },
          ),
        ),
      ],
    );
  }
}
