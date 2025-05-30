import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Image.asset('assets/logo.png', height: 150),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTabContent(String text, String detail) {
    return Center(
      child: GestureDetector(
        onLongPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdScreen(detail: detail)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(text, style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saad Nawaz Chatha'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.person), text: 'About Me'),
            Tab(icon: Icon(Icons.location_city), text: 'Hometown'),
            Tab(icon: Icon(Icons.school), text: 'Student Life'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent('My name is Saad Nawaz Chatha. I am a Baby Flutter developer.',
              'My name is John Doe. I am a dedicated Flutter developer with a passion for building clean and functional mobile applications.'),
          _buildTabContent('I come from Islamabad.',
              'I come from Islamabad, the beautiful capital city of Pakistan known for its greenery and peaceful environment.'),
          _buildTabContent('Studying at Bahria University.',
              'I am currently a student at Bahria University pursuing a degree in Computer Science. My student life here is filled with learning, innovation, and great experiences.'),
        ],
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  final String detail;

  const ThirdScreen({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detailed Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          detail,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
