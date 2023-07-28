import 'package:flutter/material.dart';

import '../widgets/card_group_widget.dart';
import '../widgets/home_app_bar_widget.dart';
import '../widgets/menu_widget.dart';
import '../widgets/routine_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  MenuWidget(title: 'Routine'),
                  Row(
                    children: [
                      Expanded(child: RoutineCardWidget()),
                      Expanded(child: RoutineCardWidget()),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: MenuWidget(title: 'My Task'),
                ),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.now_widgets_outlined),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
