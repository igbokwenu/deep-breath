import 'package:animate_do/animate_do.dart';
import 'package:deep_breath/components/constants.dart';
import 'package:deep_breath/components/size_config.dart';
import 'package:deep_breath/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
                PopupMenuItem(
                    child: Divider(
                  color: kPrimaryColor,
                  thickness: 1,
                )),
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
                      press: () => Get.off(() => AnxietyScreen()),
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
          applicationName: _packageInfo.appName,
          applicationVersion: _packageInfo.version,
        );
        break;
      case 1:
        Get.to(() => AnxietyScreen());
        break;
      case 2:
        Get.to(() => AnxietyScreen());
        break;
    }
  }
}
