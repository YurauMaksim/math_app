import 'package:flutter/material.dart';

class GradesChoosing extends StatelessWidget {
  const GradesChoosing({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: 39,
          ),
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 24)),
              child: const Text('7 класс')),
          const SizedBox(
            height: 400,
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
