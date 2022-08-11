import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:deep_breath/models/models.dart';
import 'package:deep_breath/screens/audio_player/audio_player.dart';
import 'package:deep_breath/screens/home/responsive_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class HealingScreen extends StatelessWidget {
  const HealingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String a = "Healing comes in seed form";
    const String aUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2FHealing%20comes%20in%20seed%20form.mp3?alt=media&token=ddf52e07-8f8c-4e35-b182-15f812c7a510";
    const String b = "Confess your sins";
    const String bUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2FConfess%20your%20sins.mp3?alt=media&token=0c35a7c8-dbd4-4ab4-a5a8-2e63a4c613db";
    const String c = "Stand your ground";
    const String cUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F3.%20stand%20your%20ground.mp3?alt=media&token=fe3986e7-1c55-499c-b8aa-5c842a548603";
    const String d = "There is something great inside you";
    const String dUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F4.%20There's%20something%20great%20inside%20you.mp3?alt=media&token=586df2e9-1bb9-4663-b114-81628e6803c7";
    const String e = "According to your faith";
    const String eUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F5.%20According%20to%20your%20faith%20updated.mp3?alt=media&token=c17a1965-f115-4fad-8c1c-55837eb6f656";
    const String f = "Pray with authority";
    const String fUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F6.%20Pray%20with%20authority.mp3?alt=media&token=a3bc851a-14e0-4a4d-8482-ad7091a37d68";
    const String g = "Why do you want to be healed?";
    const String gUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F7.%20why%20do%20you%20want%20to%20be%20healed.mp3?alt=media&token=88a51622-fefb-485a-a969-d1f0436f70aa";
    const String h = "Know the source of your symptoms";
    const String hUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F8.%20Know%20the%20source%20of%20your%20symptoms.mp3?alt=media&token=799f5dd2-7b97-4182-88c4-e2699c90050d";
    const String i = "It's a process";
    const String iUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F9.%20It's%20a%20process.mp3?alt=media&token=b19f09a3-3489-4eb3-b165-1dfc6f23f277";
    const String j = "Our testimony";
    const String jUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F10.%20Our%20testimony.mp3?alt=media&token=f226f9d7-dab6-48c6-bab7-7f6385af3d1d";
    const String k = "Healing and deliverance";
    const String kUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F11.%20Healing%20and%20Deliverance.mp3?alt=media&token=85c7cb7f-100b-4052-b326-29c5be3ad95a";
    const String l = "Guard your convictions";
    const String lUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F12.%20Guard%20your%20convictions.mp3?alt=media&token=63f4ee3b-5a8d-4ea2-bbab-0b657d2fd3cc";
    const String smith = "By Alan & Holly Smith";
    VoidCallback press = () {
      Get.off(() => HealingScreen());
    };
    //final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: backGroundGradient(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: getProportionateScreenWidth(20),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blueGrey,
              size: getProportionateScreenWidth(10),
            ),
            onPressed: () {
              Get.off(() => ResponsiveHome());
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: AnimationLimiter(
              child: Center(
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
                      //HomeTopBanner(),
                      ScriptureList(
                        text: a,
                        press: () {
                          Get.to(() => MyApp(
                                url: aUrl,
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
                                url: bUrl,
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
                                url: cUrl,
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
                                url: dUrl,
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
                                url: eUrl,
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
                              url: fUrl,
                              press: press,
                              title: f,
                              author: smith,
                            ),
                          );
                        },
                      ),
                      ScriptureList(
                        text: g,
                        press: () {
                          Get.to(() => MyApp(
                                url: gUrl,
                                press: press,
                                title: g,
                                author: smith,
                              ));
                        },
                      ),
                      ScriptureList(
                        text: h,
                        press: () {
                          Get.to(() => MyApp(
                                url: hUrl,
                                press: press,
                                title: h,
                                author: smith,
                              ));
                        },
                      ),
                      ScriptureList(
                        text: i,
                        press: () {
                          Get.to(() => MyApp(
                                url: iUrl,
                                press: press,
                                title: i,
                                author: smith,
                              ));
                        },
                      ),
                      ScriptureList(
                        text: j,
                        press: () {
                          Get.to(() => MyApp(
                                url: jUrl,
                                press: press,
                                title: j,
                                author: smith,
                              ));
                        },
                      ),
                      ScriptureList(
                        text: k,
                        press: () {
                          Get.to(() => MyApp(
                                url: kUrl,
                                press: press,
                                title: k,
                                author: smith,
                              ));
                        },
                      ),
                      ScriptureList(
                        text: l,
                        press: () {
                          Get.to(
                            MyApp(
                              url: lUrl,
                              press: press,
                              title: l,
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
      ),
    );
  }
}
