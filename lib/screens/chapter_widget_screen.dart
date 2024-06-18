import 'package:flutter/material.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/subject.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/screens/grade_widget_screen.dart';
import 'package:math_app/services/firestore_service.dart';

class ChapterScreen extends StatelessWidget {
  final String subjectId;
  final Chapter chapter;

  ChapterScreen({required this.subjectId, required this.chapter});

  @override
  Widget build(BuildContext context) {
    final FirestoreService _firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
      ),
      body: StreamBuilder<List<Grade>>(
        stream: _firestoreService.getGrades(subjectId, chapter.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final grades = snapshot.data!;
            if (grades.isEmpty) {
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
              itemCount: grades.length,
              itemBuilder: (context, index) {
                final grade = grades[index];
                return ListTile(
                  title: Text(grade.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GradeScreen(
                          subjectId: subjectId,
                          chapterId: chapter.id,
                          grade: grade,
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
