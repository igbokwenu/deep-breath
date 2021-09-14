import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:deep_breath/models/models.dart';
import 'package:deep_breath/screens/audio_player/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'home/home.dart';

class AnxietyScreen extends StatelessWidget {
  const AnxietyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VoidCallback press = () {
      Get.off(() => AnxietyScreen());
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
                      text: 'Believe what God says',
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
                              press: press,
                            ));
                      },
                    ),
                    ScriptureList(
                      text: 'It is finished',
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://firebasestorage.googleapis.com/v0/b/opensource-11ed5.appspot.com/o/flutter_audio_plugin%2FSampleAudio_0.4mb.mp3?alt=media&token=a6334d66-dc48-4562-b126-ed7004b18e5c",
                              press: press,
                            ));
                      },
                    ),
                    ScriptureList(
                      text: 'According to your faith',
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
                              press: press,
                            ));
                      },
                    ),
                    ScriptureList(
                      text: 'HE meant what he said',
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
                              press: press,
                            ));
                      },
                    ),
                    ScriptureList(
                      text: 'Yes and Amen',
                      press: () {
                        Get.to(() => MyApp(
                              url:
                                  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
                              press: press,
                            ));
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
