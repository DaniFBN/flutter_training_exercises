import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 2,
        title: SizedBox(
          height: kToolbarHeight * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  const Expanded(child: TextField()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text('Enviar para São Paulo 03477010'),
                  Icon(Icons.keyboard_arrow_right_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
