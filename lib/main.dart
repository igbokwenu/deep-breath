import 'package:animate_do/animate_do.dart';
import 'package:deep_breath/screens/anxiety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'components/constants.dart';
import 'components/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: Home(),
      initialRoute: "/",
      routes: {
        '/': (ctx) => Home(),
        '/anxiety': (ctx) => AnxietyScreen(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                FadeInLeft(
                  child: HomeItem(
                    subText: 'anxiety',
                    image: 'assets/images/falling_square.gif',
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key? key,
    required this.image,
    required this.subText,
  }) : super(key: key);

  final String image;
  final String subText;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 320;
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(15),
          right: getProportionateScreenWidth(15),
          top: getProportionateScreenWidth(20)),
      child: Stack(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(imageSize),
            height: getProportionateScreenWidth(imageSize),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      image,
                      width: getProportionateScreenWidth(imageSize),
                      height: getProportionateScreenWidth(imageSize),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: recommendedLinearGradient(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                        vertical: getProportionateScreenWidth(10)),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: kWhiteColor),
                        children: [
                          TextSpan(
                            text: "overcome\n",
                            style: bannerTextStyle(),
                          ),
                          TextSpan(
                            text: subText,
                            style: bannerSubTextStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: kPrimaryColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Get.to(AnxietyScreen());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
