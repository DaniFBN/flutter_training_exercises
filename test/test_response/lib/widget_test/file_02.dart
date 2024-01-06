import 'package:flutter/material.dart';

class File02 extends StatelessWidget {
  const File02({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Detect this Widget by Key',
          key: ValueKey('key-to-detect'),
        ),
      ),
    );
  }
}
