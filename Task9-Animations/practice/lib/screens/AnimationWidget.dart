import 'dart:math';
import 'package:flutter/material.dart';
import 'package:practice/providers/animationProvider.dart';
import 'package:provider/provider.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<AnimationProvider>(context, listen: false).changeState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationProvider>(
      builder: ((context, provider, child) {
        return GestureDetector(
          onTap: () => Provider.of<AnimationProvider>(context, listen: false).changeState(),
          child: Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: const Text("Tap the Screen!"),
              backgroundColor: Colors.black,
              centerTitle: true,
            ),
            body: SafeArea(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                alignment: Alignment(provider.x, provider.y),
                curve: Curves.easeIn,
                child: Container(
                  width: provider.squareSize,
                  height: provider.squareSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(provider.radius),
                    color: Colors.red[provider.colorIntensity],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
