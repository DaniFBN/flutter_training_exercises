import 'package:flutter/material.dart';

import '../widgets/card_group_widget.dart';
import '../widgets/task_card_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Task'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
        bottom: TabBar(
          controller: tabController,
          dividerColor: Colors.transparent,
          tabs: const [
            Text('Today'),
            Text('Week'),
            Text('Month'),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                CardGroupWidget(
                  icon: Icons.post_add_rounded,
                  title: 'To Do',
                  subtitle: '5 tasks',
                ),
                CardGroupWidget(
                  icon: Icons.list_alt_rounded,
                  title: 'In progress',
                  subtitle: '9 tasks',
                ),
                CardGroupWidget(
                  icon: Icons.task_outlined,
                  title: 'Done',
                  subtitle: '21 tasks',
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemBuilder: (_, __) {
                  return const TaskCardWidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
