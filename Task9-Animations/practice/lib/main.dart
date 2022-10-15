import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice/providers/animationProvider.dart';
import 'package:practice/screens/AnimationWidget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<AnimationProvider>(
          create: (context) => AnimationProvider(),
          child: const AnimationWidget()),
    );
  }
}
