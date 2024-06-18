import 'package:flutter/material.dart';
import 'package:math_app/models/activity_type.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/models/subject.dart';
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

    Subject russian = Subject(id: 'rus', title: 'Русский язык');
    Chapter writing = Chapter(id: 'writing', title: 'Чистописание');
    Grade tenGrade = Grade(id: 'tenGrade', title: '10 класс');
    Topic someTopic = Topic(id: 'some', topicName: 'Some topic very important');
    ActivityType activityType = ActivityType(
        id: 'practice',
        title: 'Практика',
        type: 'practice',
        content: "some content");
    ActivityType theory = ActivityType(
        id: 'theory', title: 'Теория', type: 'theory', content: "some content");

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
