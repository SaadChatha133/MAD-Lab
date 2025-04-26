import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Practice',
      home: const screen(
        title: 'App practice'
      ),
    );
  }
}

class screen extends StatefulWidget{
  const screen({super.key,required this.title});
  final String title;
  @override
  State<screen> createState()=>_screenState();
}

class _screenState extends State<screen>{
  int count = 0;
  void increment(){
    setState((){
      count++;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 186, 34, 228),
        title: Center(
          child: Text(widget.title),
          ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('Number of times Button Pressed: '),
            Text('$count',
            style: Theme.of(context).textTheme.headlineMedium,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Press to Increment',
        child: const Icon(Icons.add),
        ),
    );
  }
}
