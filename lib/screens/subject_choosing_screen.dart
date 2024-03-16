import 'package:flutter/material.dart';
import 'package:math_app/data/subjects_data.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/models/subject.dart';
import 'package:math_app/models/subject.dart';
import 'package:math_app/screens/grades_choosing_screen.dart';
import 'package:math_app/screens/subjects_screen.dart';
import 'package:math_app/widgets/choose_button_icon.dart';
import 'package:math_app/widgets/choose_subject_grid_item.dart';

class SubjectChoosingScreen extends StatelessWidget {
  const SubjectChoosingScreen({super.key});

  void _selectSubject(BuildContext context, Subject subject) {
    Navigator.push(context,
        MaterialPageRoute(builder: (ctx) => SubjectScreen(subject: subject)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Выберите предмет"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final subject in subjects)
            SubjectGridItem(
                subject: subject,
                onSelectSubject: () => _selectSubject(context, subject))
        ],
      ),
    );

    // this is an old code but it's working well
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         const Text(
    //           'Тут будет лого?',
    //           style: TextStyle(color: Colors.white, fontSize: 32),
    //         ),
    //         const SizedBox(
    //           height: 200,
    //         ),
    //         const Text(
    //           'Выберите курс',
    //           style: TextStyle(color: Colors.white, fontSize: 24),
    //         ),
    //         const SizedBox(
    //           height: 30,
    //         ),
    //         ...subjects.map((subject) {
    //           return ChooseButtonIcon(
    //               name: subject.subjectName,
    //               onTap: () {
    //                 // TODO;
    //               });
    //         }),
    //       ],
    //     ),
    //   ),
    // );
  }
}
