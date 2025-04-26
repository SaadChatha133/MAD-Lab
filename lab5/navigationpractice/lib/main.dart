import 'package:flutter/material.dart';
import 'intro.dart';
import 'education.dart';
import 'hobby.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Introduction", style: TextStyle(color: Colors.yellowAccent),),
            backgroundColor: const Color.fromARGB(255, 79, 26, 26),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.person), text: 'Introduction'),
              Tab(icon: Icon(Icons.school), text: "Education"),
              Tab(icon: Icon(Icons.sports_esports), text: "Hobbies"),
            ],
            ),
          ),
          body: Container(
            child: TabBarView(children: [
              Intro(),
              Education(),
              Hobby(),
            ],),
          ),
        ),
      ),
    );
  }
}
