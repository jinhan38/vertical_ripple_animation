import 'package:flutter/material.dart';
import 'package:vertical_ripple_animation/circle_animation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> firstAnimation;
  late Animation<double> secondAnimation;
  late Tween<double> tween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(() {
        print('animationController : ${animationController.value}');
        if (animationController.value > 0) {}
      });
    firstAnimation = CurvedAnimation(parent: animationController, curve: Curves.linear);
    secondAnimation = CurvedAnimation(parent: animationController, curve: Curves.linear);
    tween = Tween<double>(begin: 1, end: 100);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final screenHeight = MediaQuery.of(context).size.height;
    double circleSize = screenWidth * 0.08;
    return Scaffold(
      body: GestureDetector(
        child: Container(
          child: Stack(
            children: [
              ElevatedButton(
                onPressed: () {
                  print('클릭');
                  animationController.forward();
                },
                child: Text("클릭"),
              ),
              Transform(
                  transform: Matrix4.identity()..translate(screenWidth * 0.5 - circleSize, screenHeight * 0.7),
                  child: CircleAnimation(animation: firstAnimation, tween: tween, color: Colors.purpleAccent, circleDirection: CircleDirection.top)),
              Transform(
                transform: Matrix4.identity()..translate(screenWidth * 0.5 - circleSize, screenHeight * 0.7 - circleSize),
                child: CircleAnimation(animation: secondAnimation, tween: tween, color: Colors.blueAccent, circleDirection: CircleDirection.bottom),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
