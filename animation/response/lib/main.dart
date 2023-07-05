import 'package:flutter/material.dart';
import 'package:response/widgets/implicit_expansion.dart';

import 'widgets/explicit_expansion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Animation Response')),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
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
                subtitle: 'Subtitle',
                description: 'Description',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
