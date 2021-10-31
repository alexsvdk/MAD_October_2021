import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TinderBehavior extends HookWidget {
  final Widget child;
  final VoidCallback? right;
  final VoidCallback? left;

  const TinderBehavior({Key? key, required this.child, this.right, this.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(initialValue: 0.5);
    final animation = Tween<Offset>(begin: Offset(-1.3, 0), end: Offset(1.3, 0))
        .animate(controller);

    useEffect(() {
      controller.value = 0.5;
    });

    final myanimation = Tween(begin: -1.0, end: 1.0).animate(controller);

    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onPanUpdate: (data) {
        final delta = data.delta.dx;
        controller.value += delta / width;
      },
      onPanEnd: (data) {
        if (myanimation.value.abs() < 0.5) {
          controller.animateTo(
            0.5,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInBack,
          );
        } else {
          if (myanimation.value > 0.5) {
            right?.call();
          } else {
            left?.call();
          }
        }
      },
      child: Center(
          child: AnimatedBuilder(
              animation: myanimation,
              child: SlideTransition(position: animation, child: child),
              builder: (context, child) {
                return Transform.scale(
                  scale: 1 - myanimation.value.abs() / 5,
                  child: Transform.rotate(
                      angle: (pi / 12) * myanimation.value, child: child),
                );
              })),
    );
  }
}
