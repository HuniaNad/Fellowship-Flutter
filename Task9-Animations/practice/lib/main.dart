import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationWidget(),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  late double squareSize;
  late int colorIntensity;
  double x = 0;
  double y = 0;
  late double radius;

  @override
  initState() {
    super.initState();
    squareSize = randomSquare();
    colorIntensity = randomIntensity();
    radius = randomRadius();
  }

  int randomIntensity() {
    var intensity = Random().nextInt(9) * 100;
    return intensity == 0 ? 50 : intensity;
  }

  double randomSquare() {
    var size = Random().nextInt(300);
    return size < 10 ? 30 : size.toDouble();
  }

  double randomDimension() {
    var dimension = Random().nextInt(3);
    return dimension == 2 || x == 1 || y == 1 ? -1 : dimension.toDouble();
  }

  double randomRadius() {
    var radius = Random().nextInt(100);
    return radius < 10 ? 10 : radius.toDouble();
  }

  void changeState() {
    setState(() {
      squareSize = randomSquare();
      x = randomDimension();
      y = randomDimension();
      colorIntensity = randomIntensity();
      radius = randomRadius();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeState,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Tap the Screen!"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SafeArea(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 900),
            alignment: Alignment(x, y),
            curve: Curves.bounceIn,
            child: Container(
              width: squareSize,
              height: squareSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: Colors.red[colorIntensity],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
