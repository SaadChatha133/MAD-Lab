import 'package:flutter/material.dart';
class Hobby extends StatelessWidget{
  @override
  Widget build(BuildContext cntext){
    return Padding(padding: EdgeInsets.all(20),
    child: Text(
        "• Football\n• Gaming\n•Table Tennis",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}