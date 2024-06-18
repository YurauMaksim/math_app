// import 'package:flutter/material.dart';
// import 'package:math_app/data/math/math_practice.dart';
// import 'package:math_app/data/math/math_theory.dart';
// import 'package:math_app/models/activity_type.dart';
// import 'package:math_app/models/chapter.dart';
// import 'package:math_app/models/grade.dart';
// import 'package:math_app/models/subject.dart';
// import 'package:math_app/models/topic.dart';
// import 'package:math_app/screens/practice_screen.dart';
// import 'package:math_app/screens/theory_screen.dart';

// class ActivityButton extends StatelessWidget {
//   final ActivityType activity;
//   final Topic topic;
//   final Grade grade;
//   final Chapter chapter;
//   final Subject subject;

//   const ActivityButton(
//       {super.key,
//       required this.activity,
//       required this.topic,
//       required this.grade,
//       required this.chapter,
//       required this.subject});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (final theory in theories)
//           if (theory.subjectId == subject.id &&
//               theory.gradeId == grade.id &&
//               theory.chapterId == chapter.id &&
//               theory.topicId == topic.id &&
//               activity.id == theory.activityTypeId)
//             OutlinedButton(
//                 child: Text(activity.title),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (ctx) => TheoryScreen(theory: theory)),
//                   );
//                 }),
//         for (final practice in practices)
//           if (practice.subjectId == subject.id &&
//               practice.gradeId == grade.id &&
//               practice.chapterId == chapter.id &&
//               practice.topicId == topic.id &&
//               activity.id == practice.activityTypeId)
//             OutlinedButton(
//                 child: Text(activity.title),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (ctx) => PracticeScreen(practice: practice)),
//                   );
//                 })
//       ],
//     );
//   }
// }
