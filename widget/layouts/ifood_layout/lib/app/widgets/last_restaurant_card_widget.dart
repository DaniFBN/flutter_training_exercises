import 'package:flutter/material.dart';

class LastRestaurantCardWidget extends StatelessWidget {
  const LastRestaurantCardWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          foregroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
