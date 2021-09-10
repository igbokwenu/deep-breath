import 'package:animate_do/animate_do.dart';
import 'package:deep_breath/screens/anxiety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/constants.dart';
import 'components/size_config.dart';
import 'models/models.dart';

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
    final int duration = 1300;
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("About"),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                Icon(Icons.info_outline),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                ),
                Icon(Icons.settings),
              ],
            ),
            alignment: Alignment.centerRight,
          ),
        ),
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  FadeInLeft(
                    duration: Duration(milliseconds: duration),
                    child: HomeItem(
                      subText: 'sickness',
                      image: 'assets/images/sickness.gif',
                      press: () => Get.off(AnxietyScreen()),
                    ),
                  ),
                  FadeInRight(
                    duration: Duration(milliseconds: duration),
                    child: HomeItem(
                      subText: 'anxiety',
                      image: 'assets/images/anxiety_square.gif',
                      press: () => Get.to(AnxietyScreen()),
                    ),
                  ),
                  FadeInDown(
                    duration: Duration(milliseconds: duration),
                    child: HomeItem(
                      subText: 'fear',
                      image: 'assets/images/falling_square.gif',
                      press: () => Get.to(AnxietyScreen()),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(50),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
