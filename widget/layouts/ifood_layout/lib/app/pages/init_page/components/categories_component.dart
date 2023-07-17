import 'package:flutter/material.dart';

import '../../../utils/mocks.dart';
import '../../../widgets/category_card_widget.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (_, index) {
        return CategoryCardWidget(
          imageUrl: AppMocks.danImage,
          title: 'Item $index',
        );
      },
    );
  }
}
