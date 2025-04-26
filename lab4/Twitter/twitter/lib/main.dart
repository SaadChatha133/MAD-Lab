import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 13, 9, 220),
        body: Center(
          child: Image.asset(
            "assets/twitter.png",
            width:120,
            height: 120,
          ),
        ),  
      ),
    );
  }
}
