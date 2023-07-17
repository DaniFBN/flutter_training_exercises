import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // Pode ser fixado comentado o porquê foi ignorado ou tirando o ignore.
  // Nesse caso, a ideia era comentar o porquê
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

  void onPressed() {
    setState(() {
      _counter++;
    });
  }

  void listener() {
    print(valueNotifier.value);
  }

  @override
  void dispose() {
    valueNotifier.removeListener(listener);

    super.dispose();
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
                onPressed: () => throw Exception(),
                child: const Text('throw Exception'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
