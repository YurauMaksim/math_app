import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.gradesChoosing, {super.key});
  final void Function() gradesChoosing;
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
          OutlinedButton.icon(
              onPressed: gradesChoosing,
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 24)),
              icon: const Icon(Icons.arrow_right_alt_sharp),
              label: const Text('Математика')),
        ],
      ),
    );
  }
}
