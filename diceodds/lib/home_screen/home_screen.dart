// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'home_screen_components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var homeComponents = HomeScreenComponents();

  bool isGameEnded = false;
  List<int> firstAndLastNumber = [2, 12];
  List<int> rolledNumbers = [];

  void rollTapped(int roll) {
    setState(() {
      rolledNumbers.add(roll);
    });
  }

  void endGameTapped() {
    setState(() {
      isGameEnded = !isGameEnded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          isGameEnded
              ? homeComponents.endOfGameView(this)
              : homeComponents.diceView(this),
          SizedBox(height: 30),
          homeComponents.endGameButton(this),
        ],
      ),
    );
  }
}
