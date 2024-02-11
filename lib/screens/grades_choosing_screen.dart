import 'package:flutter/material.dart';
import 'package:math_app/views/back_button_icon.dart';
import 'package:math_app/views/choose_button.dart';
import 'package:math_app/data/grades_data.dart';
import 'package:math_app/views/scaffold_app.dart';

class GradesChoosingScreen extends StatelessWidget {
  const GradesChoosingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const gradeName = grades;

    return ScaffoldApp(
      screenWidget: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Выберите класс',
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            ...gradeName.map((grade) {
              return ChooseButton(name: grade, onTap: () {});
            }),
            const SizedBox(
              height: 50,
            ),
            BackOutlinedButtonIcon(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
