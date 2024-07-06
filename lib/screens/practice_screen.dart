import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_app/models/equation.dart';
import 'package:math_app/models/practice.dart';
import 'package:math_app/models/test_question.dart';
import 'package:math_app/models/user_answer_practice.dart';
import 'package:math_app/screens/result_screen.dart';
import 'package:math_app/services/firestore_service.dart';
import 'package:math_app/widgets/equation_widget.dart';
import 'package:math_app/widgets/test_question_widget.dart';
import 'package:math_app/constants/text_constants.dart' as constants;

class PracticeScreen extends StatefulWidget {
  final String topicId;

  PracticeScreen({required this.topicId});

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  final List<UserAnswer> _userAnswers = [];

  void _submitAnswer(String questionId, String answer) {
    final existingAnswerIndex =
        _userAnswers.indexWhere((a) => a.questionId == questionId);
    if (existingAnswerIndex >= 0) {
      _userAnswers[existingAnswerIndex] =
          UserAnswer(questionId: questionId, userAnswer: answer);
    } else {
      _userAnswers.add(UserAnswer(questionId: questionId, userAnswer: answer));
    }
  }

  void _checkAnswers(
      List<Equation> equations, List<TestQuestion> testQuestions) {
    List<String> missingAnswers = [];

    for (var equation in equations) {
      if (!_userAnswers.any((answer) => answer.questionId == equation.id)) {
        missingAnswers.add(equation.equation);
      }
    }

    for (var question in testQuestions) {
      if (!_userAnswers.any((answer) => answer.questionId == question.id)) {
        missingAnswers.add(question.question);
      }
    }

    if (missingAnswers.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultsScreen(topicId: widget.topicId, userAnswers: _userAnswers),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(constants.NOT_ALL_ANSWERS_ARE_FILLED),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: missingAnswers.map((answer) => Text(answer)).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(constants.OK),
            ),
          ],
        ),
      );
    }
  }

  List<T> _getRandomSubset<T>(List<T> list, int count) {
    final random = Random();
    final subset = <T>[];
    final copy = List<T>.from(list);

    for (var i = 0; i < count; i++) {
      if (copy.isEmpty) break;
      final index = random.nextInt(copy.length);
      subset.add(copy.removeAt(index));
    }

    return subset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Практика'),
      ),
      body: StreamBuilder<List<Practice>>(
        stream: _firestoreService.getPractices(widget.topicId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final practices = snapshot.data!;
            if (practices.isEmpty) {
              return Center(
                child: Text('Нет практики для выбранной темы'),
              );
            }
            final practice = practices.first;

            final equations = _getRandomSubset(practice.equations,
                5); //5 means that 5 randomly equation will be choosing from the firebase
            final testQuestions = _getRandomSubset(practice.testQuestions, 5);

            return ListView(
              children: [
                ...equations.map((e) => EquationWidget(
                      equation: e,
                      onSubmitAnswer: (answer) => _submitAnswer(e.id, answer),
                    )),
                ...testQuestions.map((q) => TestQuestionWidget(
                      question: q,
                      onSubmitAnswer: (answer) => _submitAnswer(q.id, answer),
                    )),
                ElevatedButton(
                  onPressed: () => _checkAnswers(equations, testQuestions),
                  child: Text('Проверить ответы'),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
