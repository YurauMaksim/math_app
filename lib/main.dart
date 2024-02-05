import 'package:flutter/material.dart';
import 'package:math_app/screens/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 4, 101, 33),
                Color.fromARGB(255, 33, 134, 2),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const StartScreen()),
      ),
    ),
  );
}
