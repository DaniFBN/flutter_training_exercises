import 'package:flutter/material.dart';
import 'package:mercado_livre_layout/app/themes/color_extension.dart';
import 'package:mercado_livre_layout/app/utils/app_mocks.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final colors = theme.extension<ColorExtension>()!;

    return Card(
      child: SizedBox(
        width: size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                right: 8,
                left: 8,
                top: 8,
              ),
              child: Text('Também te interessa'),
            ),
            const Divider(),
            Center(
              child: Image.network(
                AppMocks.danImage,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item 1 ash ajsasja sjas as asaoskpo aispo iaps ois',
                    style: theme.textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: r'R$ 105',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const TextSpan(text: '45'),
                        TextSpan(
                          text: ' 35% OFF',
                          style: TextStyle(
                            color: colors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Frete Grátis',
                    style: TextStyle(
                      color: colors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// - Card
//   - Column
//     - Text
//     - Divider
//     - Image.network
//     - Text
//     - Text.rich
//     - Text
