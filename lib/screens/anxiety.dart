import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:deep_breath/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../main.dart';

class AnxietyScreen extends StatelessWidget {
  const AnxietyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundGradient(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: getProportionateScreenWidth(45),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blueGrey,
              size: getProportionateScreenWidth(20),
            ),
            onPressed: () {
              Get.to(Home());
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 800),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: ScaleAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    HomeTopBanner(),
                    ScriptureList(
                      text: 'Believe what God says',
                      press: () {},
                    ),
                    ScriptureList(
                      text: 'It is finished',
                      press: () {},
                    ),
                    ScriptureList(
                      text: 'According to your faith',
                      press: () {},
                    ),
                    ScriptureList(
                      text: 'Believe what God says',
                      press: () {},
                    ),
                    ScriptureList(
                      text: 'Believe what God says',
                      press: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
