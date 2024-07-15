import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(
            child: Text('Dice'),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // Generates a random number between 1 and 6
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: rollDice,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(16)),
              Expanded(
                flex: 1,
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
              Padding(padding: EdgeInsets.all(16)),
              Expanded(
                flex: 1,
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
              Padding(padding: EdgeInsets.all(16)),
            ],
          ),
          SizedBox(height: 20), // Add some spacing between the dice and the button
          ElevatedButton(
            onPressed: rollDice,
            child: Text('Roll Dice'),
          ),
        ],
      ),
    );
  }
}
