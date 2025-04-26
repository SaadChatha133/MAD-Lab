import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/facebook.png",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Facebook',
                      style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                          fontSize: 32,
                          color: Colors.cyanAccent ,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.home, color: Colors.cyanAccent, size: 30),
                        SizedBox(width: 20),
                        Icon(Icons.search, color: Colors.cyanAccent, size: 30),
                        SizedBox(width: 20),
                        Icon(Icons.notifications, color: Colors.cyanAccent, size: 30),
                        SizedBox(width: 20),
                        Icon(Icons.message, color: Colors.cyanAccent, size: 30),
                        SizedBox(width: 20),
                        Icon(Icons.person, color: Colors.cyanAccent, size: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),        
      ),
    );
  }
}


