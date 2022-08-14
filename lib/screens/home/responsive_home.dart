import 'package:deep_breath/screens/home/responsive_layout_model.dart';
import 'package:flutter/material.dart';

import 'desktop_home.dart';
import 'mobile_home.dart';

class ResponsiveHome extends StatefulWidget {
  const ResponsiveHome({Key? key}) : super(key: key);

  @override
  _ResponsiveHomeState createState() => _ResponsiveHomeState();
}

class _ResponsiveHomeState extends State<ResponsiveHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileHome(),
        desktopBody: DesktopHome(),
      ),
    );
  }
}
