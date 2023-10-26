import 'package:flutter/material.dart';
import 'package:internationalization_response/app/l10n/gen/app_localizations.dart';

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
                AppLocalizations.of(context).welcome,
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
          icon: const Icon(
            Icons.notifications_none_rounded,
            semanticLabel: 'Notification',
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'Menu',
          ),
        ),
      ],
    );
  }
}
