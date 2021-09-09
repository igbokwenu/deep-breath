import 'package:deep_breath/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnxietyScreen extends StatelessWidget {
  const AnxietyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 1200),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: ScaleAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  HomeTopBanner(),
                  Container(
                    alignment: Alignment.center,
                    width: 400,
                    height: 100,
                    color: Colors.green,
                    child: Text("Anxiety"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
