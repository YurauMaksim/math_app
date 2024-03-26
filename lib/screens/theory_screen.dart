import 'package:flutter/material.dart';

import 'package:math_app/models/subject.dart';
import 'package:math_app/models/theory.dart';

class TheoryScreen extends StatelessWidget {
  final Theory theory;

  const TheoryScreen({super.key, required this.theory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(theory.title),
      ),
      body: Column(
        children: [
          Text(theory.title),
        ],
      ),
    );
  }
}
