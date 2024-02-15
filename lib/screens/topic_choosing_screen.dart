import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_app/data/math/math_algebra_topics.dart';
import 'package:math_app/data/math/math_chapters.dart';
import 'package:math_app/data/math/math_geometry_topics.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/topic.dart';
import 'package:math_app/views/back_button_icon.dart';
import 'package:math_app/views/choose_button.dart';
import 'package:math_app/views/scaffold_app.dart';

class TopicChoosingScreen extends StatelessWidget {
  const TopicChoosingScreen({super.key, required this.chapter});

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
              const Text(
                'Выберите раздел',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              ...topics.map((topic) {
                return ChooseButton(name: topic, onTap: () {});
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
