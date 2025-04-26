import 'package:flutter/material.dart';
class Intro extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(20),
      child: Text(
        "My Name is Saad Nawaz Chatha.",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}