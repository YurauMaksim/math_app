import 'package:flutter/material.dart';
import 'package:math_app/main.dart';
import 'package:math_app/models/subject.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/screens/chapter_widget_screen.dart';
import 'package:math_app/services/firestore_service.dart';

class SubjectContent extends StatelessWidget {
  final Subject subject;

  const SubjectContent({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final FirestoreService _firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.title),
      ),
      body: StreamBuilder<List<Chapter>>(
        stream: _firestoreService.getChapters(subject.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final chapters = snapshot.data!;
            if (chapters.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('nothing is in here',
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
                      "try to choose something new",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    )
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final chapter = chapters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
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
                    title: Text(chapter.title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterScreen(
                            subjectId: subject.id,
                            chapter: chapter,
                          ),
                        ),
                      );
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
