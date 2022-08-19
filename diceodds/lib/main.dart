// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:diceodds/styles.dart';
import 'package:flutter/material.dart';
import 'home_screen/home_screen.dart';

void main() {
  runApp(const DiceOdds());
}

class DiceOdds extends StatelessWidget {
  const DiceOdds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Odds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Dice Odds'),
    );
  }
}
