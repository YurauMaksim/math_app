import 'package:flutter/material.dart';
import 'package:math_app/data/math_chapters.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/models/math_chapter.dart';
import 'package:math_app/views/back_button_icon.dart';
import 'package:math_app/views/choose_button.dart';
import 'package:math_app/views/scaffold_app.dart';

class ChapterChoosingScreen extends StatelessWidget {
  const ChapterChoosingScreen({super.key, required this.grade});

  final String grade;
  @override
  Widget build(BuildContext context) {
    const chapter = chapters;
    return ScaffoldApp(
      screenWidget: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              grade,
              style: const TextStyle(fontSize: 35, color: Colors.white),
            ),
            const Text(
              'Выберите раздел',
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            ...chapter.map((chapter) {
              return ChooseButton(name: chapter, onTap: () {});
            }),
            const SizedBox(
              height: 50,
            ),
            BackOutlinedButtonIcon(onTap: () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
