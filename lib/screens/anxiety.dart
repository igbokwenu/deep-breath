import 'package:flutter/material.dart';

class AnxietyScreen extends StatelessWidget {
  const AnxietyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: Text("Anxiety"),
      ),
    );
  }
}
