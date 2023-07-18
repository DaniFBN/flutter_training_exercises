import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              foregroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/54218517?v=4',
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back,',
                  style: theme.textTheme.titleSmall,
                ),
                Text(
                  'Daniel Fernandes',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: Column(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Routines',
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Expanded(
                    child: Row(
                      children: [
                        Expanded(child: RoutineCardWidget()),
                        Expanded(child: RoutineCardWidget()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(),
            ),
          ),
        ],
      ),
    );
  }
}

class RoutineCardWidget extends StatelessWidget {
  const RoutineCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.sunny),
              ),
            ),
            const SizedBox(height: 8),
            const Text('Morning Routine'),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text('Progress'),
                const Spacer(),
                Text(
                  '60%',
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.primaryColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 4),
            LayoutBuilder(
              builder: (_, constraints) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.black26,
                        height: 6,
                        width: constraints.maxWidth,
                      ),
                      Container(
                        color: theme.primaryColor,
                        height: 6,
                        width: constraints.maxWidth * .7,
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
