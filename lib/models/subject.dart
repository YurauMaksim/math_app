import 'package:flutter/material.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/grade.dart';

class Subject {
  const Subject({
    required this.id,
    required this.title,
    required this.chapters,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final List<Chapter> chapters;
  final Color color;
}
