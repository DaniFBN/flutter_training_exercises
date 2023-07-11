import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TabBarWidget({super.key, required this.controller});

  final TabController controller;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      tabs: const [
        Tab(text: 'Início'),
        Tab(text: 'Restaurantes'),
        Tab(text: 'Mercados'),
        Tab(text: 'Bebidas'),
        Tab(text: 'Farmácias'),
        Tab(text: 'Pets'),
        Tab(text: 'Shopping'),
      ],
    );
  }
}
