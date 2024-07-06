import 'package:flutter/material.dart';
import 'package:math_app/main.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/screens/grade_widget_screen.dart';
import 'package:math_app/services/firestore_service.dart';
import 'package:math_app/constants/text_constants.dart' as constants;

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

            grades.sort(
                (a, b) => int.parse(a.title).compareTo(int.parse(b.title)));

            return ListView.builder(
              itemCount: grades.length,
              itemBuilder: (context, index) {
                final grade = grades[index];
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
                    leading: Icon(Icons.book),

                    title: Text("${grade.title} ${constants.CLASS}"),
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
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${constants.ERROR}: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
