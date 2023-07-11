import 'package:flutter/material.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({
    Key? key,
    required this.onTap,
    required this.notificationAmount,
  }) : super(key: key);

  final VoidCallback onTap;
  final int notificationAmount;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Stack(
        children: [
          const Center(
            child: Icon(Icons.notifications_none_rounded),
          ),
          Positioned(
            top: 4,
            right: 0,
            child: Badge.count(count: notificationAmount),
          ),
        ],
      ),
    );

    // return GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     color: Colors.transparent,
    //     child: Stack(
    //       children: [
    //         const Center(
    //           child: Padding(
    //             padding: EdgeInsets.all(8.0),
    //             child: Icon(Icons.notifications_none_rounded),
    //           ),
    //         ),
    //         Positioned(
    //           top: 8,
    //           right: 4,
    //           child: Badge.count(count: notificationAmount),
    //           // Container(
    //           //   decoration: const BoxDecoration(
    //           //     color: Colors.red,
    //           //     shape: BoxShape.circle,
    //           //   ),
    //           //   child: Padding(
    //           //     padding: const EdgeInsets.all(4.0),
    //           //     child: Text(
    //           //       '$notificationAmount',
    //           //       style: const TextStyle(fontSize: 10),
    //           //     ),
    //           //   ),
    //           // )
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
