import 'package:flutter/material.dart';

class ImplicitExpansion extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String description;

  const ImplicitExpansion({
    required this.title,
    required this.description,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  State<ImplicitExpansion> createState() => _ImplicitExpansionState();
}

class _ImplicitExpansionState extends State<ImplicitExpansion> {
  final _duration = const Duration(seconds: 1);
  bool isExpanded = false;

  void _toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  bool get hasSubtitle => widget.subtitle != null;

  Color get expandedColor => isExpanded
      ? Theme.of(context).primaryColor
      : Theme.of(context).textTheme.bodyMedium!.color!;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _toggle,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: _duration,
                      style: TextStyle(color: expandedColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title),
                          if (hasSubtitle) Text(widget.subtitle!)
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0.0,
                      duration: _duration,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: expandedColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRect(
              child: AnimatedAlign(
                heightFactor: isExpanded ? 1.2 : 0,
                duration: _duration,
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
          ],
        ),
      ),
    );
  }
}
