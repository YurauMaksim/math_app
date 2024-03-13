import 'package:math_app/models/activity_type.dart';
import 'package:math_app/models/grade.dart';

class Chapter {
  final String id;
  final String title;
  final List<ActivityType> activityType;
  final List<Grade> grades;

  const Chapter(
      {required this.id,
      required this.title,
      required this.activityType,
      required this.grades});
}
