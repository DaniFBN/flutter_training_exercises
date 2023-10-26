import 'package:flutter/material.dart';
import 'package:internationalization_response/app/l10n/gen/app_localizations_extension.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: context.intl.search,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  MenuWidget(title: context.intl.routine),
                  const Row(
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: MenuWidget(title: context.intl.myTask),
                ),
                CardGroupWidget(
                  icon: Icons.post_add_rounded,
                  title: context.intl.toDo,
                  subtitle: context.intl.taskAmount(5),
                ),
                CardGroupWidget(
                  icon: Icons.list_alt_rounded,
                  title: context.intl.inProgress,
                  subtitle: context.intl.taskAmount(1),
                ),
                CardGroupWidget(
                  icon: Icons.task_outlined,
                  title: context.intl.done,
                  subtitle: context.intl.taskAmount(0),
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
