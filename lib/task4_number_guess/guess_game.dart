import 'dart:math';
import 'package:flutter/material.dart';

class GuessGame extends StatefulWidget {
  @override
  _GuessGameState createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  final random = Random();
  int number = Random().nextInt(100) + 1;
  int attempts = 0;
  String message = "Guess a number between 1 and 100";

  void checkGuess(String value) {
    int guess = int.parse(value);
    attempts++;

    if (guess > number) {
      message = "Too High!";
    } else if (guess < number) {
      message = "Too Low!";
    } else {
      message = "Correct! Attempts: $attempts";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Guess Game")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(message),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: checkGuess,
            ),
          ],
        ),
      ),
    );
  }
}
