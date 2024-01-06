import 'package:flutter/material.dart';

class File06 extends StatefulWidget {
  const File06({super.key});

  @override
  State<File06> createState() => _File06State();
}

class _File06State extends State<File06> {
  bool useFirstColor = true;

  void toggle() {
    setState(() {
      useFirstColor = !useFirstColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: toggle,
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            width: 200,
            height: 200,
            color: useFirstColor ? Colors.red : Colors.blue,
          ),
        ),
      ),
    );
  }
}
