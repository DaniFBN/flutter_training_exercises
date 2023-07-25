import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(106);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      toolbarHeight: preferredSize.height,
      title: SizedBox(
        height: preferredSize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar no Mercado Livre',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    'Enviar para São Paulo 03477010',
                    style: theme.primaryTextTheme.titleMedium,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
