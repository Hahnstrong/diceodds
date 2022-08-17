// ignore_for_file: prefer_const_constructors
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
      home: const HomeScreen(title: 'Dice Odds'),
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
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(12, (index) {
                return InkWell(
                  onTap: () {
                    _incrementCounter(index + 1);
                  },
                  child: Center(
                    child: Text(
                      '${index + 1}',
                    ),
                  ),
                );
              }),
            ),
          ),
          InkWell(
            onTap: _endGameTapped,
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.purple,
              child: Center(
                child: Text(
                  'End Game',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
