import 'package:flutter/material.dart';

import '../widgets/calendar_widget.dart';
import '../widgets/menu_widget.dart';
import '../widgets/task_card_widget.dart';

class RoutinesPage extends StatelessWidget {
  const RoutinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Routines')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: CalendarWidget(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MenuWidget(
                title: 'Today Task',
                onTap: () => Navigator.of(context).pushNamed('/tasks'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListView.builder(
                  itemBuilder: (_, __) {
                    return const TaskCardWidget();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
