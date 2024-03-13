import 'package:flutter/material.dart';
import 'package:math_app/models/grade.dart';
import 'package:math_app/screens/chapter_choosing_screen.dart';
import 'package:math_app/views/back_button_icon.dart';
import 'package:math_app/widgets/choose_button.dart';
import 'package:math_app/views/scaffold_app.dart';

class GradesChoosingScreen extends StatelessWidget {
  const GradesChoosingScreen(
      {super.key, required this.title, required this.grades});

  final String title;
  final List<Grade> grades;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemBuilder: (ctx, index) => Text(grades[index].title));

    if (grades.isEmpty) {
      content = const Center(
        child: Column(
          children: [
            Text('There is nothing here'),
            SizedBox(
              height: 10,
            ),
            Text('Try to choose a different category')
          ],
        ),
      );
    }

    return Scaffold(
      body: content,
    );

    // ScaffoldApp(
    //   screenWidget: SizedBox(
    //     width: double.infinity,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           grade.subjectName,
    //           style: const TextStyle(fontSize: 35, color: Colors.white),
    //         ),
    //         const Text(
    //           'Выберите класс',
    //           style: TextStyle(fontSize: 35, color: Colors.white),
    //         ),
    //         const SizedBox(
    //           height: 30,
    //         ),
    //         ...grade.grades.map((grade) {
    //           return ChooseButton(
    //               name: grade,
    //               onTap: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => ChapterChoosingScreen(
    //                               grade: grade,
    //                             )));
    //               });
    //         }),
    //         const SizedBox(
    //           height: 50,
    //         ),
    //         BackOutlinedButtonIcon(onTap: () {
    //           Navigator.pop(context);
    //         }),
    //       ],
    //     ),
    //   ),
    // );
  }
}
