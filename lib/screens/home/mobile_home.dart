import 'package:animate_do/animate_do.dart';
import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:deep_breath/models/models.dart';
import 'package:deep_breath/screens/home/components/faith.dart';
import 'package:deep_breath/screens/home/components/healing.dart';
import 'package:deep_breath/screens/home/components/salvation.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../components/textConstants.dart';
import 'components/anxiety.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

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
            PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
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
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.block_outlined,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text("Remove Ads"),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.sports_kabaddi_outlined,
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
                  DelayedDisplay(
                    delay: Duration(seconds: 2),
                    child: Pulse(
                      delay: Duration(milliseconds: 2100),
                      duration: Duration(milliseconds: 5000),
                      infinite: true,
                      child: GestureDetector(
                        onTap: () {
                          Alert(
                            context: context,
                            title: "Coming Soon",
                            desc: "Topic: ",
                            content: Column(
                              children: [
                                Text(
                                  "Time: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          getProportionateScreenWidth(16)),
                                ),
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Let me Join!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          getProportionateScreenWidth(14)),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: getProportionateScreenWidth(120),
                                color: Colors.orange.withOpacity(0.7),
                              )
                            ],
                          ).show();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: getProportionateScreenWidth(15)),
                          padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(10),
                            right: getProportionateScreenWidth(10),
                            top: getProportionateScreenWidth(2),
                            bottom: getProportionateScreenWidth(2),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(20),
                            ),
                          ),
                          child: Text(
                            "Join our Bible Study",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeInLeft(
                    duration: Duration(milliseconds: duration),
                    child: MobileHomeItem(
                      subText: 'sickness',
                      image: 'assets/images/milk-bottle-baby-bottle-sick.gif',
                      press: () => Get.to(() => HealingScreen()),
                    ),
                  ),
                  FadeInRight(
                    duration: Duration(milliseconds: duration),
                    child: MobileHomeItem(
                      subText: 'anxiety',
                      image: 'assets/images/anxiety_square.gif',
                      press: () => Get.to(() => AnxietyScreen()),
                      backgroundColor: Colors.red,
                    ),
                  ),
                  FadeInDown(
                    duration: Duration(milliseconds: duration),
                    child: MobileHomeItem(
                      subText: 'faith',
                      titleText: "build\n",
                      image: 'assets/images/believe.gif',
                      press: () => Get.to(() => FaithScreen()),
                    ),
                  ),
                  FadeInDown(
                    duration: Duration(milliseconds: duration),
                    child: MobileHomeItem(
                      subText: 'saved',
                      titleText: "get\n",
                      image: 'assets/images/saved.gif',
                      press: () => Get.to(() => SalvationScreen()),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(50),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        showAboutDialog(
          context: context,
          applicationIcon: Container(
            width: getProportionateScreenWidth(100),
            height: getProportionateScreenWidth(100),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/deep_breath_logo2.png"))),
          ),
          applicationName: _packageInfo.appName,
          applicationVersion: _packageInfo.version,
          applicationLegalese: "Developed by Increase Okechukwu Divine-Wisdom",
          children: [
            Divider(
              thickness: 2,
            ),
            Text(
              aboutText,
              style: TextStyle(fontSize: getProportionateScreenWidth(12)),
            ),
          ],
        );
        break;
      case 1:
        Alert(
          context: context,
          type: AlertType.error,
          title: "Deep Breath",
          desc: "Under development.",
          buttons: [
            DialogButton(
              child: Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        break;
      case 2:
        Alert(
          context: context,
          type: AlertType.none,
          title: mailIntro,
          desc: contactNames,
          style: AlertStyle(
            titleStyle: TextStyle(
              fontSize: getProportionateScreenWidth(15),
            ),
            descStyle: TextStyle(
              fontSize: getProportionateScreenWidth(15),
            ),
          ),
          content: Column(
            children: [
              Text(
                contactEmail,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(16)),
              ),
            ],
          ),
          buttons: [
            DialogButton(
              child: Text(
                "Send a mail",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              width: 170,
            )
          ],
        ).show();
        break;
    }
  }
}
