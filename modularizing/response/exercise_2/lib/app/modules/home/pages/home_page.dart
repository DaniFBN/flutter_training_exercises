import 'package:exercise_2/app/core/shared/services/navigator_service.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/stores/theme_store.dart';
import '../../../core/modules/user/stores/user_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.userStore,
    required this.email,
    required this.themeStore,
  }) : super(key: key);

  final UserStore userStore;
  final ThemeStore themeStore;
  final String email;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email: ',
                style: theme.textTheme.titleMedium,
              ),
              Text(
                'Param: $email',
                style: theme.textTheme.titleLarge,
              ),
              ValueListenableBuilder(
                valueListenable: userStore,
                builder: (_, email, __) {
                  return Text(
                    'UserStore: $email',
                    style: theme.textTheme.titleLarge,
                  );
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: themeStore.toggle,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: theme.colorScheme.secondaryContainer,
                ),
                icon: const Icon(Icons.dark_mode),
                label: const Text('Change Theme'),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () async {
                  userStore.setUser('logout');

                  await Future.delayed(const Duration(seconds: 2));

                  NavigatorService.pushReplacementNamed('/login/');
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: theme.colorScheme.secondaryContainer,
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Sair'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
