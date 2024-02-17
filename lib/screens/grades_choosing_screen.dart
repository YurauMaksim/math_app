import 'package:flutter/material.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/screens/chapter_choosing_screen.dart';
import 'package:math_app/views/back_button_icon.dart';
import 'package:math_app/views/choose_button.dart';
import 'package:math_app/views/scaffold_app.dart';

class GradesChoosingScreen extends StatelessWidget {
  const GradesChoosingScreen({super.key, required this.grade});

  final Grade grade;
  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      screenWidget: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              grade.subjectName,
              style: const TextStyle(fontSize: 35, color: Colors.white),
            ),
            const Text(
              'Выберите класс',
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            ...grade.grades.map((grade) {
              return ChooseButton(
                  name: grade,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChapterChoosingScreen(
                                  grade: grade,
                                )));
                  });
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
