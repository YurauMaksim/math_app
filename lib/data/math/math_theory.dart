import 'package:math_app/models/theory.dart';

var map = {
  'SomeText': "SomeImage",
  'SomeOtherText': "SomeImage",
  'SomeSecondOtherText': "No Image"
};

var theories = [
  Theory(
      id: 'Theory1',
      subjectId: 'math',
      chapterId: 'algebra',
      gradeId: '7grade',
      topicId: 'topic1',
      title: "Числовые и алгебраические выражения",
      theoryData: [map]),
  Theory(
      id: 'Theory2',
      subjectId: 'math',
      chapterId: 'algebra',
      gradeId: '7grade',
      topicId: 'topic1',
      title: "Числовые выражения",
      theoryData: [map]),
];
