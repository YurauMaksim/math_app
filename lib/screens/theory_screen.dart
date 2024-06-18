import 'package:flutter/material.dart';
import 'package:math_app/models/theory.dart';

class TheoryScreen extends StatelessWidget {
  final Theory theory;

  const TheoryScreen({super.key, required this.theory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(theory.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: theory.contents.length,
          itemBuilder: (context, index) {
            final content = theory.contents[index];
            if (content.type == 'text') {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  content.content,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            } else if (content.type == 'image') {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.network(content.content),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
