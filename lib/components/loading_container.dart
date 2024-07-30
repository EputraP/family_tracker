import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer(
      {super.key, required this.isVisible, required this.size});

  final bool isVisible;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isVisible,
        child: SizedBox.expand(
          child: Container(
              color: const Color.fromARGB(150, 212, 212, 212),
              child: LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.white, size: size)),
        ));
  }
}
