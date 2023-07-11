import 'package:flutter/material.dart';

import 'notification_icon_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.tabBar,
  }) : super(key: key);

  final PreferredSizeWidget tabBar;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: tabBar,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Flexible(
            child: Text(
              'Avenida Presidente Castelo Branco, 5556',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.diamond_outlined),
        ),
        NotificationIconWidget(
          onTap: () => print('tapped'),
          notificationAmount: 2,
        ),
      ],
    );
  }
}
