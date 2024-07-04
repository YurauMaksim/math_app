import 'package:flutter/material.dart';
import 'package:math_app/models/activity_type.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/equation.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/models/practice.dart';
import 'package:math_app/models/subject.dart';
import 'package:math_app/models/test_question.dart';
import 'package:math_app/models/theory.dart';
import 'package:math_app/models/theory_content.dart';
import 'package:math_app/models/topic.dart';
import 'package:math_app/screens/subjects_screen.dart';
import 'package:math_app/services/firestore_service.dart';
import 'package:math_app/widgets/choose_subject_grid_item.dart';

class SubjectChoosingScreen extends StatelessWidget {
  const SubjectChoosingScreen({super.key});

  void _selectSubject(BuildContext context, Subject subject) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SubjectScreen(subject: subject),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO this is for test adding some topics or something
    final FirestoreService _firestoreService = FirestoreService();

    // _firestoreService
    //     .addPractice(Practice(id: "some", topicId: "Topic1", equations: [
    //   Equation(id: "1", equation: "2 - 1", solution: "1")
    // ], testQuestions: [
    //   TestQuestion(
    //       id: "1",
    //       question: "Что такое уравнение",
    //       options: ["Какой-то бред", "Какая-то хрень"],
    //       correctAnswer: "Какая-то хрень")
    // ]));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Выберите предмет"),
      ),
      body: StreamBuilder<List<Subject>>(
        stream: _firestoreService.getSubjects(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final subjects = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return SubjectGridItem(
                  subject: subject,
                  onSelectSubject: () => _selectSubject(context, subject),
                );
              },
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
