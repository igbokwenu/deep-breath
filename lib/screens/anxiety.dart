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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    width: 400,
                    height: 100,
                    color: Colors.green,
                    child: Text("Anxiety"),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    width: 400,
                    height: 100,
                    color: Colors.green,
                    child: Text("Anxiety"),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
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
