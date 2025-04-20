import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Saad Nawaz Chatha',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Icon(
                Icons.star,
                color: Colors.deepOrange,
                size: 50,
              ),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'My Name is '),
                    TextSpan(
                      text: 'Saad Nawaz Chatha ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '. My Qualities are: '),
                    TextSpan(
                      text: 'Problem Solving, Creativity ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    TextSpan(text: 'and '),
                    TextSpan(
                      text: 'Colaborative Communication.',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
