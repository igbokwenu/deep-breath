import 'package:deep_breath/screens/home/responsive_layout_model.dart';
import 'package:flutter/material.dart';

import 'desktop_home.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: Home(),
        desktopBody: DesktopHome(),
      ),
    );
  }
}
