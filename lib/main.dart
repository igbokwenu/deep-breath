import 'package:deep_breath/screens/anxiety.dart';
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
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    final List<String> titles = [
      "RED anxiety",
      "YELLOW",
      "BLACK",
      "CYAN",
      "BLUE",
      "GREY",
      "PINK"
    ];

    final List<Widget> images = [
      GestureDetector(
        onTap: () => Get.to(AnxietyScreen()),
        child: Container(
          color: Colors.red,
        ),
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.cyan,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.grey,
      ),
      Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: Stack(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(242),
              height: getProportionateScreenWidth(100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/falling.gif',
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
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(color: kWhiteColor),
                          children: [
                            TextSpan(
                              text: "Phones and Laptops\n",
                              style: bannerTextStyle(),
                            ),
                            TextSpan(
                              text: 'Amazing Prizes + Quick Delivery!',
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
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {},
                  align: ALIGN.CENTER,
                  onSelectedItem: (index) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
