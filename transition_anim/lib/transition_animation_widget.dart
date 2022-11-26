import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animation_controller.dart';

class TransitionAnim extends StatefulWidget {
  final Widget child;
  final TransitionAnimationController animationController;
  final int order;

  const TransitionAnim(
      {super.key,
      required this.child,
      required this.animationController,
      this.order = 0});

  @override
  State<TransitionAnim> createState() => _TransitionAnimState();
}

class _TransitionAnimState extends State<TransitionAnim>
    with TickerProviderStateMixin {
  late Animation<double> animation;

  @override
  void initState() {
    widget.animationController.forward();

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController,
        curve: Interval((1 / 5) * widget.order, 1.0,
            curve: Curves.fastOutSlowIn)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: widget.child,
          ),
        );
      },
    );
  }
}
