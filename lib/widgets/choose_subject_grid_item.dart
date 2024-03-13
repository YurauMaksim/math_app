import 'package:flutter/material.dart';
import 'package:math_app/models/subject.dart';

class SubjectGridItem extends StatelessWidget {
  final Subject subject;
  final void Function() onSelectSubject;

  const SubjectGridItem(
      {super.key, required this.subject, required this.onSelectSubject});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectSubject,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              subject.color.withOpacity(0.55),
              subject.color.withOpacity(0.9)
            ])),
        child: Text(
          subject.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
