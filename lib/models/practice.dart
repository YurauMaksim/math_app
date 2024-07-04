import 'package:math_app/models/equation.dart';
import 'package:math_app/models/test_question.dart';

class Practice {
  final String id;
  final String topicId;
  final List<Equation> equations;
  final List<TestQuestion> testQuestions;

  Practice({
    required this.id,
    required this.topicId,
    required this.equations,
    required this.testQuestions,
  });

  factory Practice.fromFirestore(Map<String, dynamic> data) {
    return Practice(
      id: data['id'],
      topicId: data['topicId'],
      equations: (data['equations'] as List)
          .map((e) => Equation.fromFirestore(e))
          .toList(),
      testQuestions: (data['testQuestions'] as List)
          .map((q) => TestQuestion.fromFirestore(q))
          .toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'topicId': topicId,
      'equations': equations.map((e) => e.toFirestore()).toList(),
      'testQuestions': testQuestions.map((q) => q.toFirestore()).toList(),
    };
  }
}
