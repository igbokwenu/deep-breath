import 'package:deep_breath/screens/home/components/anxiety.dart';
import 'package:deep_breath/screens/home/responsive_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
      title: 'Deep Breath ',
      theme: ThemeData(primarySwatch: Colors.orange),
      // home: Home(),
      initialRoute: "/",
      routes: {
        '/': (ctx) => ResponsiveHome(),
        '/anxiety': (ctx) => AnxietyScreen(),
      },
    );
  }
}
