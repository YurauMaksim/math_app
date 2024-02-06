import 'package:flutter/material.dart';
import 'package:math_app/screens/grades_choosing.dart';
import 'package:math_app/screens/start_screen.dart';

class Math extends StatefulWidget {
  const Math({super.key});

  @override
  State<Math> createState() {
    return _MathState();
  }
}

class _MathState extends State<Math> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const GradesChoosing();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 4, 101, 33),
                Color.fromARGB(255, 33, 134, 2),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: activeScreen),
      ),
    );
  }
}
