import 'package:flutter/material.dart';

class ScaffoldApp extends StatelessWidget {
  const ScaffoldApp({super.key, required this.screenWidget});

  final Widget screenWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 7, 109, 51),
              Color.fromARGB(255, 33, 134, 2),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
