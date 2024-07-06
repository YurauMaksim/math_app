import 'package:flutter/material.dart';
import 'package:math_app/main.dart';
import 'package:math_app/models/topic.dart';
import 'package:math_app/models/activity_type.dart';
import 'package:math_app/screens/practice_screen.dart';
import 'package:math_app/services/firestore_service.dart';
import 'package:math_app/screens/theory_screen.dart'; // Ensure you import the TheoryScreen

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
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: ListTile(
                    trailing:
                        Icon(Icons.arrow_forward), // Example trailing widget
                    tileColor:
                        theme.highlightColor, // Background color for the tile
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    leading: Icon(Icons.book), // Example leading widget
                    title: Text(activity.title),
                    onTap: () {
                      if (activity.type == 'theory') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TheoryScreen(theoryId: activity.content),
                          ),
                        );
                      } else if (activity.type == 'practice') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PracticeScreen(topicId: activity.content),
                          ),
                        );
                      }
                    },
                  ),
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
