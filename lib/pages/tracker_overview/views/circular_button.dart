import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.icon,
      required this.onClick});

  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(
        onPressed: onClick,
        icon: icon,
        enableFeedback: true,
      ),
    );
  }
}
