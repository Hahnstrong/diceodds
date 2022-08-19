// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:diceodds/styles.dart';
import 'package:flutter/material.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> firstAndLastNumber = [2, 12];
  List<int> rolledNumbers = [];

  void _incrementCounter(int roll) {
    setState(() {
      rolledNumbers.add(roll);
    });
  }

  void _endGameTapped() {
    print('tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.purple,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  '    ${rolledNumbers.join(', ')}    ',
                ),
              ),
            ),
          ),
          rowOfNumbers(firstAndLastNumber[0]),
          rowOfNumbers(firstAndLastNumber[0] + 3),
          rowOfNumbers(firstAndLastNumber[0] + 6),
          rowOfNumbers(firstAndLastNumber[0] + 9),
          InkWell(
            onTap: _endGameTapped,
            child: Container(
              decoration: MyStyles().basicBitchBox,
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  'End Game',
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  // Widget rollInputView() {
  //   return Container(
  //     child: Column(
  //       children: [
          
  //       ]
  //     ),
  //   );
  // }

  Widget rowOfNumbers(int firstNumber) {
    return Expanded(
      child: Row(
        children: [
          number(firstNumber),
          number(firstNumber + 1),
          number(firstNumber + 2),
        ],
      ),
    );
  }

  Widget number(int number) {
    bool emptyNumber = number > firstAndLastNumber.last;

    return Expanded(
      child: InkWell(
        onTap: emptyNumber ? (){} : () => _incrementCounter(number) ,
        child: Center(
          child: Text(
            emptyNumber ? '' : '$number',
          ),
        ),
      )
    );
  }
}
