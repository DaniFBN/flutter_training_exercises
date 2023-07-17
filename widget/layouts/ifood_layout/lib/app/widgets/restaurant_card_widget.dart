// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ifood_layout/app/widgets/circle_divider_widget.dart';
import 'package:ifood_layout/app/widgets/coupon_card_widget.dart';

import '../utils/mocks.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bodySmall = theme.textTheme.bodySmall!;

    return SizedBox(
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 28,
            foregroundImage: NetworkImage(AppMocks.fTeamImage),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: DefaultTextStyle(
              style: bodySmall,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Restaurant Name',
                              style: theme.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 14,
                                  color: Colors.amber.shade800,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  '4,4',
                                  style: bodySmall.copyWith(
                                    color: Colors.amber.shade800,
                                  ),
                                ),
                                const CircleDividerWidget(),
                                const Text('Mercado'),
                                const CircleDividerWidget(),
                                const Text('2,1 km'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.favorite_outline_rounded,
                        size: 20,
                        color: bodySmall.color,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Text('92-102 min'),
                      CircleDividerWidget(),
                      Text(r'R$ 11,99'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const CouponCardWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
