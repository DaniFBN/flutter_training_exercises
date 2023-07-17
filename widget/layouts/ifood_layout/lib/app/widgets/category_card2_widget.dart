import 'package:flutter/material.dart';

class CategoryCard2Widget extends StatelessWidget {
  const CategoryCard2Widget({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (_, constraints) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Stack(
                  children: [
                    Container(
                      height: constraints.maxHeight / 2,
                      color: Colors.green.shade300,
                    ),
                    Center(
                      child: Image.network(
                        imageUrl,
                        width: constraints.maxWidth * .8,
                        height: constraints.maxHeight * .8,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        Text(title),
      ],
    );
  }
}
