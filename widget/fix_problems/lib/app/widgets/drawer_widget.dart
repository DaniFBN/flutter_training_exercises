import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const CircleAvatar(
                    foregroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/54218517?v=4',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Daniel Fernandes',
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  final value = ++index;
                  final item = menuItem('Item $value');

                  if (value % 4 == 0) {
                    return Column(
                      children: [
                        item,
                        const Divider(),
                      ],
                    );
                  }

                  return item;
                },
              ),
            ),
            const Divider(),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }

  Padding menuItem(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.menu),
          const SizedBox(width: 8),
          Text(name),
        ],
      ),
    );
  }
}
