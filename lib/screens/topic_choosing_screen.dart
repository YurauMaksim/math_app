import 'package:flutter/material.dart';
import 'package:math_app/data/math/math_algebra_topics.dart';
import 'package:math_app/data/math/math_geometry_topics.dart';
import 'package:math_app/screens/activity_type_choosing_screen.dart';
import 'package:math_app/views/back_button_icon.dart';
import 'package:math_app/widgets/choose_button.dart';
import 'package:math_app/views/scaffold_app.dart';

class TopicChoosingScreen extends StatelessWidget {
  const TopicChoosingScreen(
      {super.key, required this.chapter, required this.grade});

  final String grade;
  final String chapter;
  @override
  Widget build(BuildContext context) {
    List<String> topics = algebraTopics;
    if (chapter == 'Геометрия') {
      topics = geometryTopics;
    }
    return ScaffoldApp(
      screenWidget: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                chapter,
                style: const TextStyle(fontSize: 35, color: Colors.white),
              ),
              Text(
                'Выберите раздел \n $grade',
                style: const TextStyle(fontSize: 35, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              ...topics.map((topic) {
                return ChooseButton(
                    name: topic,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityTypeChoosingScreen(
                                    topic: topic,
                                    chapter: chapter,
                                    grade: grade,
                                  )));
                    });
              }),
              const SizedBox(
                height: 50,
              ),
              BackOutlinedButtonIcon(onTap: () {
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
