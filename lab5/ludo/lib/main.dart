import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(Myapp());
}
class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String filename = 'assets/images/dice_1.png';

  void randomdice()
  {
    int randomdice = Random().nextInt(5)+1;

    if(randomdice == 1)
    {
      filename = 'assets/images/dice_1.png';
    }
    else if(randomdice == 2)
    {
      filename = 'assets/images/dice_2.png';
    }
    else if(randomdice == 3)
    {
      filename = 'assets/images/dice_3.png';
    }
    else if(randomdice == 4)
    {
      filename = 'assets/images/dice_4.png';
    }
    else if(randomdice == 5)
    {
      filename = 'assets/images/dice_5.png';
    }
    else{
      filename = 'assets/images/dice_6.png';
    
    }
    setState(() {
      filename;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LUDO',
      home:Scaffold(
        appBar: AppBar(title: Text('LUDO'),
        centerTitle: true,
        ),
        body:Column(
          children: [
            Image.asset(filename,height: 100,),
            ElevatedButton(onPressed: randomdice, child: Text('Roll Dice'))
          ],
        )
      ) 
    );
  }
}