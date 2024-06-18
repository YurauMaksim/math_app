import 'package:flutter/material.dart';
import 'package:math_app/models/subject.dart';
import 'package:math_app/screens/subject_content_screen.dart';

class SubjectScreen extends StatelessWidget {
  final Subject subject;

  const SubjectScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SubjectContent(subject: subject),
      ),
    );
  }
}
