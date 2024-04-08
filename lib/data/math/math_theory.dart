import 'package:math_app/models/theory.dart';

var map = {
  'SomeText': "packages/images/math/theory/7_grade/algebra/1_topic/first.png",
  'SomeOtherText':
      "packages/images/math/theory/7_grade/algebra/1_topic/second.png",
  'SomeSecondOtherText': "No Image"
};

var theories = [
  Theory(
      id: 'Theory1',
      subjectId: 'math',
      chapterId: 'algebra',
      gradeId: '7grade',
      topicId: 'topic1',
      activityTypeId: 'theory',
      title: "Числовые и алгебраические выражения",
      theoryData: [map]),
  Theory(
      id: 'Theory2',
      subjectId: 'math',
      chapterId: 'algebra',
      gradeId: '7grade',
      topicId: 'topic2',
      activityTypeId: 'theory',
      title: "Числовые выражения",
      theoryData: [map]),
  Theory(
      id: 'Theory4',
      subjectId: 'math',
      chapterId: 'algebra',
      gradeId: '8grade',
      topicId: 'topic1',
      activityTypeId: 'theory',
      title: "Числовые выражения практика",
      theoryData: [map]),
];
