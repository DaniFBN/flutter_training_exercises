import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitExpansionWithOverlay extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String description;

  const ExplicitExpansionWithOverlay({
    required this.title,
    required this.description,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  State<ExplicitExpansionWithOverlay> createState() =>
      _ExplicitExpansionWithOverlayState();
}

class _ExplicitExpansionWithOverlayState
    extends State<ExplicitExpansionWithOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> angleAnimation;
  late final Animation<Color?> expandedColorAnimation;
  late final Animation<double> heightFactorAnimation;

  final link = LayerLink();

  OverlayEntry? overlayEntry;
  bool get hasSubtitle => widget.subtitle != null;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    angleAnimation = Tween<double>(begin: 0, end: pi).animate(controller);
    expandedColorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.deepPurple,
    ).animate(controller);
    heightFactorAnimation = Tween<double>(begin: 0, end: 1.2).animate(
      controller,
    );
  }

  void showOverlay() {
    overlayEntry = OverlayEntry(
      builder: (context) {
        return CompositedTransformFollower(
          link: link,
          targetAnchor: Alignment.topLeft,
          child: Material(
            color: Colors.black26,
            child: ClipRect(
              child: Align(
                heightFactor: heightFactorAnimation.value,
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const FlutterLogo(),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(widget.description),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void _toggle() {
    if (isExpanded) {
      overlayEntry?.remove();
    } else {
      showOverlay();
    }

    isExpanded = !isExpanded;
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: link,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, contentChild) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: _toggle,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                  color: expandedColorAnimation.value,
                                ),
                              ),
                              if (hasSubtitle)
                                Text(
                                  widget.subtitle!,
                                  style: TextStyle(
                                    color: expandedColorAnimation.value,
                                  ),
                                )
                            ],
                          ),
                          Transform.rotate(
                            angle: angleAnimation.value,
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: expandedColorAnimation.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
