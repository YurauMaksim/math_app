import 'package:flutter/material.dart';

class Grade extends StatelessWidget {
  final String subjectName;
  final List<String> grades;

  const Grade({super.key, required this.subjectName, required this.grades});
  @override
  Widget build(BuildContext context) {
    return ButtonBar(); //заглушка
  }
}
