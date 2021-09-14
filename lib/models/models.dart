import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:flutter/material.dart';

class HomeTopBanner extends StatelessWidget {
  const HomeTopBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double bannerWidth = 350;
    const double bannerHeight = 150;
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(15),
          right: getProportionateScreenWidth(15),
          top: getProportionateScreenWidth(20),
          bottom: getProportionateScreenWidth(20)),
      child: Stack(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(bannerWidth),
            height: getProportionateScreenWidth(bannerHeight),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/candle_bible.jpeg',
                    width: getProportionateScreenWidth(bannerWidth),
                    height: getProportionateScreenWidth(bannerHeight),
                    fit: BoxFit.cover,
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
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(color: kWhiteColor),
                          children: [
                            TextSpan(
                              text: "",
                              style: bannerTextStyle(),
                            ),
                            // TextSpan(
                            //   text:
                            //       'Amazing Prizes + Quick Delivery!',
                            //   style: bannerSubTextStyle(),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key? key,
    required this.image,
    required this.subText,
    required this.press,
    this.backgroundColor,
  }) : super(key: key);

  final String image;
  final String subText;
  final VoidCallback press;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 330;
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(15),
        right: getProportionateScreenWidth(15),
        top: getProportionateScreenWidth(20),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                //shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20)),
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
                onTap: press,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ScriptureList extends StatelessWidget {
  const ScriptureList({
    Key? key,
    required this.text,
    required this.press,
    this.color,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const double radius = 10;
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(10)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: linearGradient(),
              //color: color ?? Colors.orange,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                  width: getProportionateScreenWidth(3), color: Colors.white),
            ),
            alignment: Alignment.center,
            width: getProportionateScreenWidth(350),
            height: getProportionateScreenWidth(70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(15),
                ),
                Icon(
                  Icons.play_circle_outline,
                  size: getProportionateScreenWidth(20),
                  color: Colors.white,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: kPrimaryColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(radius),
                onTap: press,
              ),
            ),
          )
        ],
      ),
    );
  }
}
