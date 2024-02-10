import 'package:flutter/material.dart';

class NeuButton extends StatelessWidget {
  final Function()? onTap;
  final Function()? onEnd;
  double height;
  double width;
  bool isButtonPressed;
  Widget? child;

  NeuButton(
      {required this.onTap,
      required this.isButtonPressed,
      required this.child,
      required this.onEnd,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 1800),
          onEnd: onEnd,
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isButtonPressed
                    ? Colors.grey.shade200
                    : Theme.of(context).colorScheme.background,
              ),
              boxShadow: isButtonPressed
                  ? [
                      //No Shadows
                    ]
                  : [
                      // BottomRight would be darker
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(6, 6),
                          blurRadius: 15,
                          spreadRadius: 1),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-6, -6),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ]),
          child: child),
    );
  }
}
