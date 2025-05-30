import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween(begin: 0.5, end: 1.0).animate(_controller);

    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => FoodListScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset('assets/logo.png', width: 120),
        ),
      ),
    );
  }
}

class FoodItem {
  final String name;
  final String description;
  final String image;

  FoodItem(this.name, this.description, this.image);
}

class FoodListScreen extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem('Pizza', 'Delicious cheese pizza', 'assets/food1.png'),
    FoodItem('Burger', 'Juicy beef burger', 'assets/food2.png'),
    FoodItem('Pasta', 'Creamy Alfredo pasta', 'assets/food3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food List')),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return FoodListItem(foodItem: foodItems[index]);
        },
      ),
    );
  }
}

class FoodListItem extends StatefulWidget {
  final FoodItem foodItem;

  const FoodListItem({Key? key, required this.foodItem}) : super(key: key);

  @override
  _FoodListItemState createState() => _FoodListItemState();
}

class _FoodListItemState extends State<FoodListItem>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween(begin: 1.0, end: 1.5).animate(_controller);
  }

  void _onDoubleTap() {
    setState(() {
      isLiked = !isLiked;
    });
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: ListTile(
        leading: Image.asset(widget.foodItem.image, width: 60, height: 60, fit: BoxFit.cover),
        title: Text(widget.foodItem.name),
        subtitle: Text(widget.foodItem.description),
        trailing: GestureDetector(
          onDoubleTap: _onDoubleTap,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Icon(
              Icons.favorite,
              color: isLiked ? Colors.red : Colors.grey,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
