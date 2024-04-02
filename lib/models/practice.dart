import 'package:math_app/models/interfaces/math_task.dart';

class Practice implements MathTask {
  final String id;
  final String subjectId;
  final String chapterId;
  final String gradeId;
  final String topicId;
  final String activityTypeId;
  final String title;
  final MathTask practiceData;

  Practice({
    required this.id,
    required this.subjectId,
    required this.chapterId,
    required this.gradeId,
    required this.topicId,
    required this.activityTypeId,
    required this.title,
    required this.practiceData,
  });

  @override
  String printRightAnswer() {
    return "The right answer";
  }
}
