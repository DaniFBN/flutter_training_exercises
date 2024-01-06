import 'package:flutter/material.dart';

class File03 extends StatelessWidget {
  const File03({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          semanticsLabel: 'Detect this Widget by Type',
        ),
      ),
    );
  }
}
