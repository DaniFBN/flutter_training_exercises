import 'package:flutter/material.dart';

import 'widgets/explicit_expansion.dart';
import 'widgets/explicit_expansion_with_overlay.dart';
import 'widgets/implicit_expansion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Animation Response')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Scrollbar(
            controller: controller,
            thumbVisibility: true,
            child: ListView(
              controller: controller,
              children: const [
                ImplicitExpansion(
                  title: 'Title',
                  subtitle: 'Subtitle',
                  description: 'Description',
                ),
                ImplicitExpansion(
                  title: 'Title',
                  description: 'Description',
                ),
                ExplicitExpansion(
                  title: 'Title',
                  description: 'Description',
                ),
                ExplicitExpansion(
                  title: 'Title',
                  description: 'Description',
                ),
                ExplicitExpansionWithOverlay(
                  title: 'Title',
                  description: 'Description',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
