import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RhPage extends StatelessWidget {
  const RhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rh Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Rh Page')),
          const SizedBox(height: 20),
          ElevatedButton(
            // Navegação relativa
            onPressed: () => Modular.to.pushNamed('detail'), 
            child: const Text('Detail'),
          ),
        ],
      ),
    );
  }
}
