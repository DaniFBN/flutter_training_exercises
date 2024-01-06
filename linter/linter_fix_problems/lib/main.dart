import 'dart:math';

import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Porque eu quero
  // ignore: use_super_parameters
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    debugPrint(pi.toString());

    valueNotifier.addListener(listener);
  }

  void listener() {
    debugPrint(valueNotifier.value.toString());
  }

  @override
  void dispose() {
    valueNotifier.removeListener(listener);

    super.dispose();
  }

  void onTap() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: theme.textTheme.headlineMedium,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: () => throw Exception(20),
                child: const Text('throw Exception'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onTap,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
