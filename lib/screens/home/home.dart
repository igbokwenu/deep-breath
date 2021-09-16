import 'package:animate_do/animate_do.dart';
import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:deep_breath/models/models.dart';
import 'package:deep_breath/screens/home/components/healing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../anxiety.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                          Icons.remove_circle_outline,
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
                      press: () => Get.off(() => HealingScreen()),
                    ),
                  ),
                  FadeInRight(
                    duration: Duration(milliseconds: duration),
                    child: HomeItem(
                      subText: 'anxiety',
                      image: 'assets/images/anxiety_square.gif',
                      press: () => Get.off(() => AnxietyScreen()),
                      backgroundColor: Colors.red,
                    ),
                  ),
                  FadeInDown(
                    duration: Duration(milliseconds: duration),
                    child: HomeItem(
                      subText: 'fear',
                      image: 'assets/images/falling_square.gif',
                      press: () => Get.off(() => AnxietyScreen()),
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
              "In loving memory of my mum, Kathrine Ugochi Okafor, the most prayerful woman who ever lived, and Colleen Holloran Foshee of Deep Breath Ministries, a remarkable woman of faith. Special thanks to Lisa Ramsey, whose constant fellowship with me rebuilt my faith through my health challenges; And to Tochukwu Nnamonu (TC), a friend and brother who would not let things I built over the years collapse. Special thanks to Alan and Holly Smith who provided a myraid of scriptural references and faith building resources which ended up inspiring my making of this app. And to my siblings; Dee, Nnanyelu, Amaka and Sweet for their support and prayers. And to Judie, and Jack for the fellowship. \n This app was originally intended as a personal resource for building my faith in the midst of a health crises that eventually spiraled into a health and financial crisis. Over the course of time, I realised that my crisis was a spiritual first affair as the doctors could not find anything wrong with me physically. This triggered a spiritual reawakening and a journey that has brought me here. It is my hope and prayers that you find these resources helpful in whichever aspect of your life that you seek healing.",
              style: TextStyle(fontSize: getProportionateScreenWidth(12)),
            ),
          ],
        );
        break;
      case 1:
        Alert(
          context: context,
          type: AlertType.error,
          title: "RFLUTTER ALERT",
          desc: "Flutter is more awesome with RFlutter Alert.",
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
          desc: "deepbreath@skylinefuturistic.com",
          style: AlertStyle(
            titleStyle: TextStyle(
              fontSize: getProportionateScreenWidth(15),
            ),
            descStyle: TextStyle(
              fontSize: getProportionateScreenWidth(15),
            ),
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
