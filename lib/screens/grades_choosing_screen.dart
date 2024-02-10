import 'package:flutter/material.dart';
import 'package:math_app/views/choose_button.dart';
import 'package:math_app/data/grades.dart';

class GradesChoosingScreen extends StatelessWidget {
  const GradesChoosingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const gradeName = grades;

    return SizedBox(
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
          OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 24)),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Назад'))
        ],
      ),
    );
  }
}
