import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:deep_breath/models/models.dart';
import 'package:deep_breath/screens/audio_player/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../home.dart';

class HealingScreen extends StatelessWidget {
  const HealingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String a = "Healing comes in seed form";
    const String b = "Confess your sins";
    const String c = "Stand your ground";
    const String d = "There is something great inside you";
    const String e = "According to your faith";
    const String f = "Pray with authority";
    const String smith = "By Alan & Holly Smith";
    VoidCallback press = () {
      Get.off(() => HealingScreen());
    };
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
              Get.off(() => Home());
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 600),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: ScaleAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    HomeTopBanner(),
                    ScriptureList(
                      text: a,
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2FHealing%20comes%20in%20seed%20form.mp3?alt=media&token=ddf52e07-8f8c-4e35-b182-15f812c7a510",
                              press: press,
                              title: a,
                              author: smith,
                            ));
                      },
                    ),
                    ScriptureList(
                      text: b,
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2FConfess%20your%20sins.mp3?alt=media&token=0c35a7c8-dbd4-4ab4-a5a8-2e63a4c613db",
                              press: press,
                              title: b,
                              author: smith,
                            ));
                      },
                    ),
                    ScriptureList(
                      text: c,
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F3.%20stand%20your%20ground.mp3?alt=media&token=fe3986e7-1c55-499c-b8aa-5c842a548603",
                              press: press,
                              title: c,
                              author: smith,
                            ));
                      },
                    ),
                    ScriptureList(
                      text: d,
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F4.%20There's%20something%20great%20inside%20you.mp3?alt=media&token=586df2e9-1bb9-4663-b114-81628e6803c7",
                              press: press,
                              title: d,
                              author: smith,
                            ));
                      },
                    ),
                    ScriptureList(
                      text: e,
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F5.%20According%20to%20your%20faith.mp3?alt=media&token=65f75b5e-ddef-4b79-a24e-fcc7d6377fbc",
                              press: press,
                              title: e,
                              author: smith,
                            ));
                      },
                    ),
                    ScriptureList(
                      text: f,
                      press: () {
                        Get.to(
                          MyApp(
                            url:
                                "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F6.%20Pray%20with%20authority.mp3?alt=media&token=a3bc851a-14e0-4a4d-8482-ad7091a37d68",
                            press: press,
                            title: f,
                            author: smith,
                          ),
                        );
                      },
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
