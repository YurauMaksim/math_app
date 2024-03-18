import 'package:flutter/material.dart';
import 'package:math_app/models/activity_type.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/models/subject.dart';
import 'package:math_app/models/topic.dart';

const subjects = [
  Subject(
      id: 'math',
      title: 'Математика',
      chapters: [
        Chapter(id: 'algebra', title: 'Алгебра', grades: [
          Grade(
            id: '7grade',
            title: '7 класс',
            topics: [
              Topic(
                id: 'topic1',
                topicName: 'Тема 1',
                activityTypes: [
                  ActivityType(
                    id: 'theory',
                    title: 'Теория',
                  ),
                  ActivityType(id: 'practice', title: 'Практика')
                ],
              ),
              Topic(
                id: 'topic2',
                topicName: 'Тема 2',
                activityTypes: [
                  ActivityType(
                    id: 'theory',
                    title: 'Теория',
                  ),
                  ActivityType(id: 'practice', title: 'Практика')
                ],
              ),
            ],
          ),
          Grade(
            id: '8grade',
            title: '8 класс',
            topics: [
              Topic(
                id: 'topic1',
                topicName: 'Тема 1',
                activityTypes: [
                  ActivityType(
                    id: 'theory',
                    title: 'Теория',
                  ),
                  ActivityType(id: 'practice', title: 'Практика')
                ],
              ),
              Topic(
                id: 'topic2',
                topicName: 'Тема 2',
                activityTypes: [
                  ActivityType(
                    id: 'theory',
                    title: 'Теория',
                  ),
                  ActivityType(id: 'practice', title: 'Практика')
                ],
              ),
            ],
          ),
        ]),
        Chapter(id: 'geometry', title: 'Геометрия', grades: [
          Grade(
            id: '7grade',
            title: '7 класс',
            topics: [
              Topic(
                id: 'topic1344',
                topicName: 'Тема 1344',
                activityTypes: [
                  ActivityType(
                    id: 'theory',
                    title: 'Теория',
                  ),
                  ActivityType(id: 'practice', title: 'Практика')
                ],
              ),
              Topic(
                id: 'topic2234',
                topicName: 'Тема 2234',
                activityTypes: [
                  ActivityType(
                    id: 'theory',
                    title: 'Теория',
                  ),
                  ActivityType(id: 'practice', title: 'Практика')
                ],
              ),
            ],
          ),
          Grade(
            id: '8grade',
            title: '8 класс',
            topics: [
              Topic(
                id: 'topic1',
                topicName: 'Тема 1',
                activityTypes: [
                  ActivityType(
                    id: 'theory',
                    title: 'Теория',
                  ),
                  ActivityType(id: 'practice', title: 'Практика')
                ],
              ),
              Topic(
                id: 'topic2',
                topicName: 'Тема 2',
                activityTypes: [
                  ActivityType(
                    id: 'theory',
                    title: 'Теория',
                  ),
                  ActivityType(id: 'practice', title: 'Практика')
                ],
              ),
            ],
          ),
        ])
      ],
      color: Colors.cyan),
  Subject(
      id: 'russian', title: 'Русский язык', chapters: [], color: Colors.teal),
];
