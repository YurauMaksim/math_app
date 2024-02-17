import 'package:flutter/material.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/screens/grades_choosing_screen.dart';
import 'package:math_app/views/choose_button_icon.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.grades});

  final List<Grade> grades;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Тут будет лого?',
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          const SizedBox(
            height: 200,
          ),
          const Text(
            'Выберите курс',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          ...grades.map((grade) {
            return ChooseButtonIcon(
                name: grade.subjectName,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GradesChoosingScreen(grade: grade)));
                });
          }),
        ],
      ),
    );
  }
}
