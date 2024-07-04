import 'package:flutter/material.dart';
import 'package:math_app/models/equation.dart';
import 'package:math_app/models/practice.dart';
import 'package:math_app/models/test_question.dart';
import 'package:math_app/models/user_answer_practice.dart';
import 'package:math_app/screens/result_screen.dart';
import 'package:math_app/services/firestore_service.dart';
import 'package:math_app/widgets/equation_widget.dart';
import 'package:math_app/widgets/test_question_widget.dart';

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
      // Navigate to result screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultsScreen(topicId: widget.topicId, userAnswers: _userAnswers),
        ),
      );
    } else {
      // Show dialog with missing answers
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Не все ответы заполнены'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: missingAnswers.map((answer) => Text(answer)).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('ОК'),
            ),
          ],
        ),
      );
    }
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

            return ListView(
              children: [
                ...practice.equations.map((e) => EquationWidget(
                      equation: e,
                      onSubmitAnswer: (answer) => _submitAnswer(e.id, answer),
                    )),
                ...practice.testQuestions.map((q) => TestQuestionWidget(
                      question: q,
                      onSubmitAnswer: (answer) => _submitAnswer(q.id, answer),
                    )),
                ElevatedButton(
                  onPressed: () =>
                      _checkAnswers(practice.equations, practice.testQuestions),
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
