import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/tab_bar_widget.dart';
import 'init_page.dart';

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
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            tabBar: TabBarWidget(controller: tabController),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            child: TabBarView(
              controller: tabController,
              children: const [
                InitPage(),
                Center(child: Text('Restaurantes')),
                Center(child: Text('Mercados')),
                Center(child: Text('Bebidas')),
                Center(child: Text('Farmácias')),
                Center(child: Text('Pets')),
                Center(child: Text('Shopping')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
