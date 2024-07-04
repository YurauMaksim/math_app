import 'package:flutter/material.dart';
import 'package:math_app/models/user_answer_practice.dart';
import 'package:math_app/services/firestore_service.dart';
import 'package:math_app/models/practice.dart';

class ResultsScreen extends StatelessWidget {
  final List<UserAnswer> userAnswers;
  final String topicId;

  ResultsScreen({required this.userAnswers, required this.topicId});

  @override
  Widget build(BuildContext context) {
    FirestoreService _firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Результаты'),
      ),
      body: StreamBuilder<List<Practice>>(
        stream: _firestoreService.getPractices(topicId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Нет практики для этой темы.'));
          } else {
            final practices = snapshot.data!;
            final correctAnswers = {
              for (var practice in practices) ...{
                for (var eq in practice.equations) eq.id: eq.solution
              },
              for (var practice in practices) ...{
                for (var tq in practice.testQuestions) tq.id: tq.correctAnswer
              }
            };

            final results = userAnswers.map((answer) {
              final isCorrect =
                  correctAnswers[answer.questionId] == answer.userAnswer;
              return {
                'questionId': answer.questionId,
                'userAnswer': answer.userAnswer,
                'isCorrect': isCorrect,
              };
            }).toList();

            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                return ListTile(
                  title: Text('Вопрос: ${result['questionId']}'),
                  subtitle: Text('Ваш ответ: ${result['userAnswer']}'),
                  trailing: Icon(
                    result['isCorrect'] == true ? Icons.check : Icons.close,
                    color:
                        result['isCorrect'] == true ? Colors.green : Colors.red,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
