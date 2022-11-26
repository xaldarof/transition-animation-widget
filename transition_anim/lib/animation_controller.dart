import 'package:flutter/animation.dart';

class TransitionAnimationController extends AnimationController {
  final int durationMillis;

  TransitionAnimationController(
      {required super.vsync, this.durationMillis = 500});

  @override
  Duration? get duration => Duration(milliseconds: durationMillis);

  void toggle({required Function onAnimationEnd}) {
    reverse().then<dynamic>((data) {
      onAnimationEnd.call();
    });
  }
}
