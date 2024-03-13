import 'package:flutter/material.dart';
import 'package:math_app/data/subjects_data.dart';
import 'package:math_app/data/grades_data.dart';
import 'package:math_app/models/grade.dart';
import 'package:http/http.dart' as http;
import 'package:math_app/models/subject.dart';
import 'package:math_app/screens/subject_choosing_screen.dart';
import 'package:math_app/views/scaffold_app.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 1, 215, 197),
        brightness: Brightness.light));

void main() async {
  runApp(const App());
  // runApp(ScaffoldApp(
  //   screenWidget: SubjectChoosingScreen(),
  // ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const SubjectChoosingScreen(),
    );
  }
}
