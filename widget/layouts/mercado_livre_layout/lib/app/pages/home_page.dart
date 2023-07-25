import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mercado_livre_layout/app/themes/color_extension.dart';
import 'package:mercado_livre_layout/app/widgets/product_card_widget.dart';

import '../widgets/home_app_bar_widget.dart';
import '../widgets/quick_access_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final colors = theme.extension<ColorExtension>()!;

    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: Column(
        children: [
          CarouselSlider(
            items: const [
              CustomCard(),
              CustomCard(),
              CustomCard(),
            ],
            options: CarouselOptions(
              height: size.width * 0.5,
              autoPlay: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fire_truck_outlined,
                      color: colors.secondary,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text.rich(
                        style: theme.textTheme.labelMedium,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Frete grátis',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: colors.secondary,
                              ),
                            ),
                            const TextSpan(
                              text: r' em milhões de produtos a partir de R$79',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, __) => const QuickAccessCardWidget(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, __) => const ProductCardWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Card(
      child: Container(
        height: size.width * 0.5,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.blue,
      ),
    );
  }
}
