import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:deep_breath/models/models.dart';
import 'package:deep_breath/screens/audio_player/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../home.dart';

class FaithScreen extends StatelessWidget {
  const FaithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String a = "Ask in faith";
    const String aUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FBuild%20your%20faith%2Fa_faith_ask_in_faith.mp3?alt=media&token=c241389c-8acb-4cfc-b178-006b2f4a98c4";
    const String b = "Discard your doubts";
    const String bUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FBuild%20your%20faith%2Fb_discard_your_doubt.mp3?alt=media&token=a1cc99b2-9b1b-4e89-9283-d5a470219491";
    const String c = "Doubt can hinder your miracle";
    const String cUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FBuild%20your%20faith%2Fc_faith_doubt_can_hinder_your_miracle.mp3?alt=media&token=d7c56f4c-48c0-49e1-b09c-e5bb91038592";
    const String d = "Discover your authority";
    const String dUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FBuild%20your%20faith%2Fd.%20faith.discover_your_authourity.mp3?alt=media&token=17aa2d51-c6e9-43b4-9e70-deeb78c6ddef";
    const String e = "Jesus and healing";
    const String eUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FBuild%20your%20faith%2Fe.%20faith.jesus_and_healing.mp3?alt=media&token=ecad3c44-dd67-4ebc-b584-8531e1310075";
    const String f = "Jesus heals";
    const String fUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FBuild%20your%20faith%2Ff_faith_jesus_heals.mp3?alt=media&token=5005e274-bd5f-4cf2-9a8a-5b722fd49394";
    const String g = "Jesus heals (Part 2)";
    const String gUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FBuild%20your%20faith%2Fg_faith_jesus_heals_part_2.mp3?alt=media&token=9cad01cb-264b-4130-bdd8-db913bf80c22";
    const String h = "God is still the same today";
    const String hUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FBuild%20your%20faith%2Fh_faith_God_is_still_the_same_today.mp3?alt=media&token=f9626b37-4f40-4d86-86cc-cda24db002f7";
    //const String i = "It's a process";
    //const String iUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F9.%20It's%20a%20process.mp3?alt=media&token=b19f09a3-3489-4eb3-b165-1dfc6f23f277";
    //const String j = "Our testimony";
    //const String jUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F10.%20Our%20testimony.mp3?alt=media&token=f226f9d7-dab6-48c6-bab7-7f6385af3d1d";
    //const String k = "Healing and deliverance";
    //const String kUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F11.%20Healing%20and%20Deliverance.mp3?alt=media&token=85c7cb7f-100b-4052-b326-29c5be3ad95a";
    //const String l = "Guard your convictions";
    //const String lUrl =
        "https://firebasestorage.googleapis.com/v0/b/official-deep-breath.appspot.com/o/deepBreath%2FAudio%2FHealing%2F12.%20Guard%20your%20convictions.mp3?alt=media&token=63f4ee3b-5a8d-4ea2-bbab-0b657d2fd3cc";
    const String smith = "Scriptures Streamlined By Alan & Holly Smith";
    VoidCallback press = () {
      Get.off(() => FaithScreen());
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
    );
  }
}
