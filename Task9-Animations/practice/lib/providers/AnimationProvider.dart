import 'dart:math';
import 'package:flutter/material.dart';

class AnimationProvider with ChangeNotifier {
  late double squareSize;
  late int colorIntensity;
  late double x = 0;
  late double y = 0;
  late double radius;

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
    squareSize = randomSquare();
    x = randomDimension();
    y = randomDimension();
    colorIntensity = randomIntensity();
    radius = randomRadius();
    notifyListeners();
  }
}
