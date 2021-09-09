import 'package:flutter/material.dart';

class AnxietyScreen extends StatelessWidget {
  const AnxietyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: 400,
            height: 400,
            color: Colors.green,
            child: Text("Anxiety"),
          ),
        ),
      ),
    );
  }
}
