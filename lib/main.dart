import 'package:flutter/material.dart';
import 'package:math_app/data/subjects_data.dart';
import 'package:math_app/data/grades_data.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/screens/start_screen.dart';
import 'package:math_app/views/scaffold_app.dart';

void main() {
  const subject = subjects;
  const grade = grades;
  runApp(ScaffoldApp(
    screenWidget: StartScreen(
        grades: List.generate(
            2, (index) => Grade(subjectName: subject[index], grades: grade))),
  ));
}
