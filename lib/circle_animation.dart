import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CircleDirection { top, bottom }

class CircleAnimation extends AnimatedWidget {
  final Animation<double> animation;
  final Tween<double> tween;

  final Color color;
  final CircleDirection circleDirection;

  CircleAnimation({
    required this.animation,
    required this.tween,
    required this.color,
    required this.circleDirection,
    Key? key,
  }) : super(listenable: animation, key: key);

  @override
  Widget build(BuildContext context) {
    double circleSize = MediaQuery.of(context).size.width * 0.08;
    double scaleX = tween.evaluate(animation);
    double scaleY = 1;
    if (circleDirection == CircleDirection.top) {
      scaleY = tween.evaluate(animation);
    } else if (circleDirection == CircleDirection.bottom && animation.value > 0.5) {
      scaleY = -tween.evaluate(animation);
    }
    return Transform(
      alignment: FractionalOffset.bottomCenter,
      transform: Matrix4.identity()..scale(scaleX, scaleY),
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(circleSize / 2),
        ),
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}
