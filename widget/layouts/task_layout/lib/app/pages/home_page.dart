// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../widgets/card_group_widget.dart';
import '../widgets/home_app_bar_widget.dart';
import '../widgets/menu_widget.dart';
import '../widgets/routine_card_widget.dart';

// MaterialApp
//   Theme
//     HomePage
//       Scaffold
//         Column
//           Theme

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                MenuWidget(
                  title: 'Routines',
                  onTap: () => Navigator.of(context).pushNamed('/routines'),
                ),
                // SizedBox(
                //   height: 220, // Recurso didático
                //   child: ListView.builder(
                //     itemCount: 20,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (_, __) {
                //       return SizedBox(
                //         width: size.width * 0.4,
                //         child: const RoutineCardWidget(),
                //       );
                //     },
                //   ),
                // ),
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
                child: MenuWidget(
                  title: 'My Task',
                  onTap: () => Navigator.of(context).pushNamed('/tasks'),
                ),
              ),
              const CardGroupWidget(
                icon: Icons.post_add_rounded,
                title: 'To Do',
                subtitle: '5 tasks',
              ),
              const CardGroupWidget(
                icon: Icons.list_alt_rounded,
                title: 'In progress',
                subtitle: '9 tasks',
              ),
              const CardGroupWidget(
                icon: Icons.task_outlined,
                title: 'Done',
                subtitle: '21 tasks',
              ),
            ],
          ),
        ],
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
