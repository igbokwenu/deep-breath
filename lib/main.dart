import 'package:animate_do/animate_do.dart';
import 'package:deep_breath/screens/anxiety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'components/constants.dart';
import 'components/size_config.dart';
import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
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
    final int duration = 900;
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Container(
      decoration: backGroundGradient(),
      child: Scaffold(
          appBar: AppBar(
            leading: Text(""),
            title: Center(
              child: Text(
                "Deep Breath",
                style: TextStyle(fontSize: getProportionateScreenWidth(20)),
              ),
            ),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.info_outline,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text("About"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.remove_circle_outline,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text("Remove Ads"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                      child: Divider(
                    color: kPrimaryColor,
                    thickness: 1,
                  )),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.contact_mail_outlined,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text("Reach Out"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
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
                        backgroundColor: Colors.red,
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
          )),
    );
  }
}
