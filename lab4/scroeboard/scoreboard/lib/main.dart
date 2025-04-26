import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Score(),
    );
  }
}

class Score extends StatefulWidget{
  @override 
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  int A = 0;
  int B = 0;
  void add(String team, int point)
  {
    setState(() {
      if(team=='A')
      {
        A+=point;
      }
      else{
        B+=point;
      }
    });
  }
  void reset(){
    setState(() {
      A=0;
      B=0;
    });
  }
  Widget buildButton(String text, VoidCallback onPressed){
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ), 
      child: Text(text, style: TextStyle(fontSize: 16),),
      );
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Scoreboard",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Team A",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(A.toString(),
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    buildButton("+3 POINTS", () => add('A', 3)),
                    SizedBox(height: 10),
                    buildButton("+2 POINTS", () => add('A', 2)),
                    SizedBox(height: 10),
                    buildButton("FREE THROW", () => add('A', 1)),
                  ],
                ),
                ),
                Container(width: 2, height: 250, color: Colors.black12),
                Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Team A",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(B.toString(),
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    buildButton("+3 POINTS", () => add('B', 3)),
                    SizedBox(height: 10),
                    buildButton("+2 POINTS", () => add('B', 2)),
                    SizedBox(height: 10),
                    buildButton("FREE THROW", () => add('B', 1)),
                  ],
                ),
                ),
            ],
          ),
          SizedBox(height: 20),
          buildButton("RESET", reset),
        ],
      ),
    );
  }
}
