import 'package:flutter/material.dart';
import 'package:math_app/models/activity_type.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/models/subject.dart';

const subjects = [
  Subject(
      id: 'math',
      title: 'Математика',
      chapters: [
        Chapter(id: 'algebra', title: 'Алгебра', activityType: [
          ActivityType(
            id: 'theory',
            title: 'Теория',
          ),
          ActivityType(id: 'practice', title: 'Практика')
        ], grades: [
          Grade(id: '7grade', title: '7 класс'),
          Grade(id: '8grade', title: '8 класс'),
          Grade(id: '9grade', title: '9 класс'),
          Grade(id: '10grade', title: '10 класс'),
        ]),
        Chapter(id: 'geometry', title: 'Геометрия', activityType: [
          ActivityType(
            id: 'theory',
            title: 'Теория',
          ),
          ActivityType(id: 'practice', title: 'Практика')
        ], grades: [
          Grade(id: '7grade', title: '7 класс'),
          Grade(id: '8grade', title: '8 класс'),
          Grade(id: '9grade', title: '9 класс'),
          Grade(id: '10grade', title: '10 класс'),
        ])
      ],
      color: Colors.cyan),
  Subject(
      id: 'russian', title: 'Русский язык', chapters: [], color: Colors.teal),
];
