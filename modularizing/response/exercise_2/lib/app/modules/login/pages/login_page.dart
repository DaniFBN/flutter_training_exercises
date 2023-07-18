// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:exercise_2/app/core/modules/user/stores/user_store.dart';
import 'package:exercise_2/app/core/shared/stores/theme_store.dart';

import '../../../core/shared/services/navigator_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
    required this.userStore,
    required this.themeStore,
  }) : super(key: key);

  final UserStore userStore;
  final ThemeStore themeStore;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('LoginPage')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                filled: true,
                hintText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                filled: true,
                hintText: 'Senha',
                prefixIcon: Icon(Icons.password_rounded),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                userStore.setUser(emailController.text);

                NavigatorService.pushReplacementNamed(
                  '/',
                  arguments: emailController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: theme.colorScheme.secondaryContainer,
              ),
              icon: const Icon(Icons.login),
              label: const Text('Entrar'),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: themeStore.toggle,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: theme.colorScheme.secondaryContainer,
              ),
              icon: const Icon(Icons.sunny),
              label: const Text('Change Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
