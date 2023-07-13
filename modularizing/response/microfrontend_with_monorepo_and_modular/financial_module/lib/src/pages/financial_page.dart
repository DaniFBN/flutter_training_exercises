import 'package:flutter/material.dart';

class FinancialPage extends StatelessWidget {
  const FinancialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Page'),
      ),
      body: const Center(child: Text('Financial Page')),
    );
  }
}
