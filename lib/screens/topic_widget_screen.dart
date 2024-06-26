import 'package:flutter/material.dart';
import 'package:math_app/models/activity_type.dart';
import 'package:math_app/models/theory.dart';
import 'package:math_app/models/topic.dart';
import 'package:math_app/services/firestore_service.dart';
import 'package:math_app/screens/theory_screen.dart';

class TopicScreen extends StatelessWidget {
  final String subjectId;
  final String chapterId;
  final String gradeId;
  final Topic topic;

  TopicScreen({
    required this.subjectId,
    required this.chapterId,
    required this.gradeId,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    final FirestoreService _firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text(topic.topicName),
      ),
      body: StreamBuilder<List<ActivityType>>(
        stream: _firestoreService.getActivityTypes(
            subjectId, chapterId, gradeId, topic.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final activities = snapshot.data!;
            if (activities.isEmpty) {
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
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return ListTile(
                  title: Text(activity.title),
                  onTap: () async {
                    if (activity.type == 'theory') {
                      final theory =
                          await _firestoreService.getTheory(activity.content);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TheoryScreen(theory: theory),
                        ),
                      );
                    } else if (activity.type == 'practice') {
                      // Navigate to practice screen
                    }
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
