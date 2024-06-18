import 'package:flutter/material.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/models/topic.dart';
import 'package:math_app/screens/topic_widget_screen.dart';
import 'package:math_app/services/firestore_service.dart';

class GradeScreen extends StatelessWidget {
  final String subjectId;
  final String chapterId;
  final Grade grade;

  GradeScreen({
    required this.subjectId,
    required this.chapterId,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    final FirestoreService _firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text(grade.title),
      ),
      body: StreamBuilder<List<Topic>>(
        stream: _firestoreService.getTopics(subjectId, chapterId, grade.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final topics = snapshot.data!;
            if (topics.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('nothing is in here',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            )),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "try to choose something new",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    )
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                return ListTile(
                  title: Text(topic.topicName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopicScreen(
                          subjectId: subjectId,
                          chapterId: chapterId,
                          gradeId: grade.id,
                          topic: topic,
                        ),
                      ),
                    );
                  },
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
