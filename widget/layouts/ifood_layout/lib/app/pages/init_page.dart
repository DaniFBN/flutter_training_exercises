import 'package:flutter/material.dart';

import '../widgets/category_card_widget.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Flexible(
          child: Container(
            color: Colors.red,
            child: GridView.builder(
              itemCount: 8,
              shrinkWrap: false,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (_, index) {
                return CategoryCardWidget(
                  imageUrl:
                      'https://avatars.githubusercontent.com/u/54218517?v=4',
                  title: 'Item $index',
                );
              },
            ),
          ),
        ),
        // const SizedBox(height: 8),
        // Flexible(
        //   child: ListView.separated(
        //     itemCount: 8,
        //     scrollDirection: Axis.horizontal,
        //     separatorBuilder: (_, __) => const SizedBox(width: 20),
        //     itemBuilder: (_, index) {
        //       return PromotionCardWidget(color: Colors.purple.shade200);
        //     },
        //   ),
        // ),
        // const SizedBox(height: 12),
        // const Spacer(),
        // SizedBox(
        //   height: size.width * 0.4,
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
        //     child: Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(right: 12.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 'Últimas lojas',
        //                 style: theme.textTheme.titleMedium!
        //                     .copyWith(fontSize: 18),
        //               ),
        //               Text(
        //                 'Ver mais',
        //                 style: theme.textTheme.bodySmall!
        //                     .copyWith(color: theme.primaryColor),
        //               ),
        //             ],
        //           ),
        //         ),
        //         const SizedBox(height: 8),
        //         Expanded(
        //           child: ListView.separated(
        //             itemCount: 8,
        //             scrollDirection: Axis.horizontal,
        //             separatorBuilder: (_, __) => const SizedBox(width: 8),
        //             itemBuilder: (_, index) {
        //               return SizedBox(
        //                 width: size.width * .2,
        //                 child: LastRestaurantCardWidget(
        //                   imageUrl:
        //                       'https://avatars.githubusercontent.com/u/63812934?s=200&v=4',
        //                   name: 'Item asas asasas$index',
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
