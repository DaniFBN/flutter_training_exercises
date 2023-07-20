import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Row(
        children: [
          const CircleAvatar(
            foregroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/54218517?v=4',
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back,',
                style: theme.textTheme.titleSmall,
              ),
              Text(
                'Daniel Fernandes',
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ],
    );
  }
}
