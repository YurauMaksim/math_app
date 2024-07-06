import 'package:flutter/material.dart';
import 'package:math_app/main.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/models/topic.dart';
import 'package:math_app/screens/topic_widget_screen.dart';
import 'package:math_app/services/firestore_service.dart';
import 'package:math_app/constants/text_constants.dart' as constants;

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
        title: Text("${grade.title} ${constants.CLASS}"),
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
                    Text(constants.PAGE_DOESNT_EXIST,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            )),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      constants.CHOOSE_ANOTHER_PAGE,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
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
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${constants.ERROR} ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
