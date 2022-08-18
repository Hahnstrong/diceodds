// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'home_screen.dart';

class HomeScreenComponents {
  Widget diceView(HomeScreenState state) {
    return Expanded(
      child: Column(
        children: [
          rowOfNumbers(state, state.firstAndLastNumber.first),
          rowOfNumbers(state, state.firstAndLastNumber.first + 3),
          rowOfNumbers(state, state.firstAndLastNumber.first + 6),
          rowOfNumbers(state, state.firstAndLastNumber.first + 9),
        ],
      ),
    );
  }

  Widget endOfGameView(HomeScreenState state) {
    List<int> rollPossibilities = [];

    int eachPossibility = state.firstAndLastNumber.first;
    while (eachPossibility <= state.firstAndLastNumber.last) {
      rollPossibilities.add(eachPossibility);
      eachPossibility++;
    }

    return Expanded(
        child: Column(
      children:
          rollPossibilities.map((e) => quantityOfRolls(state, e)).toList(),
    ));
  }

  Widget rowOfNumbers(HomeScreenState state, int startingNumber) {
    return Expanded(
        child: Row(
      children: [
        number(state, startingNumber),
        number(state, startingNumber + 1),
        number(state, startingNumber + 2),
      ],
    ));
  }

  Widget number(HomeScreenState state, int roll) {
    bool emptyNumber = roll > state.firstAndLastNumber.last;

    return Expanded(
      child: InkWell(
        onTap: () {
          emptyNumber ? () {} : state.rollTapped(roll);
        },
        child: Center(
          child: Text(
            emptyNumber ? '' : '$roll',
          ),
        ),
      ),
    );
  }

  Widget quantityOfRolls(HomeScreenState state, int roll) {
    return Expanded(
      child: Text(
          '$roll: ${(state.rolledNumbers.where((element) => element == roll)).length}'),
    );
  }

  Widget endGameButton(HomeScreenState state) {
    return InkWell(
      onTap: state.endGameTapped,
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
    );
  }
}
