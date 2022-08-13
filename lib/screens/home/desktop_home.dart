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

class DesktopHome extends StatefulWidget {
  const DesktopHome({Key? key}) : super(key: key);

  @override
  _DesktopHomeState createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
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
    final int duration = 1200;
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
              style: TextStyle(fontSize: getProportionateScreenWidth(12)),
            ),
          ),
          actions: [
            popupMenuButton(context),
          ],
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(15),
                  ),
                  BibleStudyButton(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FadeInLeft(
                          duration: Duration(milliseconds: duration),
                          child: DesktopHomeItem(
                            subText: 'sickness',
                            image:
                                'assets/images/milk-bottle-baby-bottle-sick.gif',
                            press: () => Get.off(() => HealingScreen()),
                          ),
                        ),
                        FadeInRight(
                          duration: Duration(milliseconds: duration),
                          child: DesktopHomeItem(
                            subText: 'anxiety',
                            image: 'assets/images/anxiety_square.gif',
                            press: () => Get.off(() => AnxietyScreen()),
                            backgroundColor: Colors.red,
                          ),
                        ),
                        FadeInRight(
                          duration: Duration(milliseconds: duration),
                          child: DesktopHomeItem(
                            subText: 'faith',
                            titleText: "build\n",
                            image: 'assets/images/believe.gif',
                            press: () => Get.off(() => FaithScreen()),
                          ),
                        ),
                        FadeInRight(
                          duration: Duration(milliseconds: duration),
                          child: DesktopHomeItem(
                            subText: 'saved',
                            titleText: "get\n",
                            image:
                                'assets/images/9D98EB85-4321-4835-9FF0-822278A4C101.gif',
                            press: () => Get.off(() => SalvationScreen()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FadeInDown(
                          duration: Duration(milliseconds: duration),
                          child: DesktopHomeItem(
                            subText: 'faith',
                            titleText: "build\n",
                            image: 'assets/images/believe.gif',
                            press: () => Get.off(() => FaithScreen()),
                          ),
                        ),
                        FadeInDown(
                          duration: Duration(milliseconds: duration),
                          child: DesktopHomeItem(
                            subText: 'saved',
                            titleText: "get\n",
                            image:
                                'assets/images/9D98EB85-4321-4835-9FF0-822278A4C101.gif',
                            press: () => Get.off(() => SalvationScreen()),
                          ),
                        ),
                      ],
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

  PopupMenuButton<int> popupMenuButton(BuildContext context) {
    return PopupMenuButton<int>(
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
          title: "We look forward to your mail",
          desc: contactEmail,
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
                "Contact Alan & Holly: ",
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

class BibleStudyButton extends StatelessWidget {
  const BibleStudyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 1700),
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
                        fontSize: getProportionateScreenWidth(10)),
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  child: Text(
                    "Let me Join!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(10)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: getProportionateScreenWidth(120),
                  color: Colors.orange.withOpacity(0.7),
                )
              ],
            ).show();
          },
          child: Container(
            //margin: EdgeInsets.only(top: getProportionateScreenWidth(15)),
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
                  fontSize: getProportionateScreenWidth(8),
                  color: kPrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
