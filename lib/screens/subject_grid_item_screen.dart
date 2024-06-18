import 'package:flutter/material.dart';
import 'package:math_app/models/subject.dart';

class SubjectGridItem extends StatelessWidget {
  final Subject subject;
  final VoidCallback onSelectSubject;

  const SubjectGridItem({
    required this.subject,
    required this.onSelectSubject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectSubject,
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Color.fromARGB(187, 71, 57, 57),
          title: Text(subject.title),
        ),
        child: Container(
          color: subject.color,
        ),
      ),
    );
  }
}
