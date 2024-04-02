import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:math_app/models/practice.dart';

import 'package:math_app/models/subject.dart';
import 'package:math_app/models/theory.dart';

class PracticeScreen extends StatelessWidget {
  final Practice practice;

  const PracticeScreen({super.key, required this.practice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(practice.title),
      ),
      body: Column(
        children: [
          Text(practice.title),
          Text(practice.practiceData.printRightAnswer()),
        ],
      ),
    );
  }
}
