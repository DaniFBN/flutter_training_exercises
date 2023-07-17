import 'package:flutter/material.dart';
import 'package:ifood_layout/app/pages/init_page/components/more_ifood_component.dart';
import 'package:ifood_layout/app/pages/init_page/components/nearby_markets_component.dart';
import 'package:ifood_layout/app/utils/mocks.dart';
import 'package:ifood_layout/app/widgets/category_name_widget.dart';
import 'package:ifood_layout/app/widgets/restaurant_card_widget.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/category_card2_widget.dart';
import '../widgets/tab_bar_widget.dart';
import 'init_page/components/categories_component.dart';
import 'init_page/components/famous_on_i_food_component.dart';
import 'init_page/components/last_restaurants_component.dart';
import 'init_page/components/promotions_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Busca'),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_outlined),
            label: 'Loja iFood',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_rounded),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Perfil',
          ),
        ],
      ),
      body: RefreshIndicator(
        edgeOffset: kToolbarHeight * 2 + 40,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: CustomScrollView(
          slivers: [
            AppBarWidget(
              tabBar: TabBarWidget(controller: tabController),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CategoriesComponent(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Container(
                height: size.width * 0.4,
                padding: const EdgeInsets.only(left: 12),
                child: const PromotionsComponent(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.width * 0.45,
                padding: const EdgeInsets.only(left: 12),
                child: const LastRestaurantsComponent(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.width * 0.7,
                padding: const EdgeInsets.only(left: 12),
                child: const NearbyMarketsComponent(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.width * 0.35,
                padding: const EdgeInsets.only(left: 12),
                child: const MoreIFoodComponent(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.width * 0.45,
                padding: const EdgeInsets.only(left: 12),
                child: const FamousOnIFoodComponent(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.width * 0.25,
                padding: const EdgeInsets.only(left: 12),
                child: ListView.separated(
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, index) {
                    return SizedBox(
                      width: size.width * .2,
                      child: const CategoryCard2Widget(
                        imageUrl: AppMocks.fTeamImage,
                        title: 'Mercado',
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: size.width * 0.2,
                padding: const EdgeInsets.only(left: 12),
                child: const Center(child: Text('TODO FILTER')),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverToBoxAdapter(
                child: CategoryNameWidget(name: 'Lojas'),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              sliver: SliverList.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (_, __) {
                  return RestaurantCardWidget(width: size.width);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
