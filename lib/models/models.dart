import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../components/textConstants.dart';

class HomeTopBanner extends StatelessWidget {
  const HomeTopBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double bannerMobileWidth = 350;
    const double bannerMobileHeight = 150;
    const double bannerDesktopWidth = 120;
    const double bannerDesktopHeight = 40;
    final currentWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(15),
          right: getProportionateScreenWidth(15),
          top: getProportionateScreenWidth(20),
          bottom: getProportionateScreenWidth(20)),
      child: Stack(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(currentWidth < mobileWidth
                ? bannerMobileWidth
                : bannerDesktopWidth),
            height: getProportionateScreenWidth(currentWidth < mobileWidth
                ? bannerMobileHeight
                : bannerDesktopHeight),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/candle_bible.jpeg',
                    width: getProportionateScreenWidth(bannerMobileWidth),
                    height: getProportionateScreenWidth(bannerMobileHeight),
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

class DesktopHomeItem extends StatelessWidget {
  const DesktopHomeItem({
    Key? key,
    required this.image,
    required this.subText,
    required this.press,
    this.backgroundColor,
    this.titleText,
  }) : super(key: key);

  final String image;
  final String subText;
  final VoidCallback press;
  final Color? backgroundColor;
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 80;
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(5),
        right: getProportionateScreenWidth(5),
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
                        horizontal: getProportionateScreenWidth(5),
                        vertical: getProportionateScreenWidth(6)),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: kWhiteColor),
                        children: [
                          TextSpan(
                            text: titleText ?? "overcome\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(8),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: subText,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                                backgroundColor: kPrimaryColor.withOpacity(0.5),
                                fontSize: getProportionateScreenWidth(7)),
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

class MobileHomeItem extends StatelessWidget {
  const MobileHomeItem({
    Key? key,
    required this.image,
    required this.subText,
    required this.press,
    this.backgroundColor,
    this.titleText,
  }) : super(key: key);

  final String image;
  final String subText;
  final VoidCallback press;
  final Color? backgroundColor;
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 320;
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
                            text: titleText ?? "overcome\n",
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
    final currentWidth = MediaQuery.of(context).size.width;
    const double mobileListWidth = 350;
    const double mobileListHeight = 70;
    const double desktopListWidth = 500;
    const double desktopListHeight = 80;
    const double radius = 10;
    return Padding(
      padding: EdgeInsets.only(
          top: getProportionateScreenWidth(4),
          bottom: getProportionateScreenWidth(6)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: linearGradient(),
                    //color: color ?? Colors.orange,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(radius),
                    border: Border.all(width: 4, color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  width: currentWidth < mobileWidth
                      ? mobileListWidth
                      : desktopListWidth,
                  height: currentWidth < mobileWidth
                      ? mobileListHeight
                      : desktopListHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.play_circle_outline,
                        size: currentWidth < mobileWidth ? 20 : 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            fontSize: currentWidth < mobileWidth ? 15 : 23,
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
          ],
        ),
      ),
    );
  }
}

Alert reachOutAlertButton(BuildContext context) {
  final currentWidth = MediaQuery.of(context).size.width;
  return Alert(
    context: context,
    type: AlertType.none,
    title: mailIntro,
    desc: contactNames,
    style: AlertStyle(
      titleStyle: TextStyle(
        fontSize: currentWidth < mobileWidth ? 15 : 16,
      ),
      descStyle: TextStyle(
        fontSize: currentWidth < mobileWidth ? 15 : 16,
      ),
    ),
    content: Column(
      children: [
        Tooltip(
          message: hollysWebsite,
          child: GestureDetector(
            onTap: launchHollysWebsite,
            child: Text(
              hollysContactWebsiteString,
              style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: currentWidth < mobileWidth ? 14 : 15),
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Tooltip(
          message: alansWebsite,
          child: GestureDetector(
            onTap: launchAlansWebsite,
            child: Text(
              alansContactWebsiteString,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: currentWidth < mobileWidth ? 14 : 15),
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),
        SelectableText(
          "Alan: ${alansEmail}",
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: currentWidth < mobileWidth ? 10 : 11),
        ),
        SizedBox(
          height: 7,
        ),
        SelectableText(
          "Holly: ${hollysEmail}",
          style: TextStyle(
              color: Colors.pink[300],
              fontWeight: FontWeight.bold,
              fontSize: currentWidth < mobileWidth ? 10 : 11),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          "Or click below to send a mail from the app",
          style: TextStyle(
              color: Colors.black,
              fontSize: currentWidth < mobileWidth ? 10 : 11),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tooltip(
              message: "Send to ${hollysEmail}",
              child: DialogButton(
                child: Text(
                  "Send to Holly",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: currentWidth < mobileWidth ? 12 : 13,
                  ),
                ),
                onPressed: launchHollysMail,
                width: currentWidth < mobileWidth ? 120 : 120,
              ),
            ),
            Tooltip(
              message: "Send to ${alansEmail}",
              child: DialogButton(
                child: Text(
                  "Send to Alan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: currentWidth < mobileWidth ? 12 : 13,
                  ),
                ),
                onPressed: launchAlansMail,
                width: currentWidth < mobileWidth ? 120 : 120,
              ),
            )
          ],
        )
      ],
    ),
    buttons: [],
  );
}

onReachOutAlertPressed(context) {
  return reachOutAlertButton(context).show();
}

class Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const Footer({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: currentWidth < mobileWidth ? 40 : 80,
        ),
        Text("Powered By Love"),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.heart_broken,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Reach Out",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
