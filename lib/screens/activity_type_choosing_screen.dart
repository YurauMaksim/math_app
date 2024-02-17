import 'package:flutter/material.dart';
import 'package:math_app/data/math/math_activity_type.dart';
import 'package:math_app/views/back_button_icon.dart';
import 'package:math_app/views/choose_button.dart';
import 'package:math_app/views/scaffold_app.dart';

class ActivityTypeChoosingScreen extends StatelessWidget {
  const ActivityTypeChoosingScreen(
      {super.key,
      required this.topic,
      required this.chapter,
      required this.grade});

  final String topic;
  final String chapter;
  final String grade;
  @override
  Widget build(BuildContext context) {
    List<String> activities = activityType;
    return ScaffoldApp(
      screenWidget: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$topic $chapter $grade',
                style: const TextStyle(fontSize: 35, color: Colors.white),
              ),
              const Text(
                'Выберите что-нибудь',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              ...activities.map((activity) {
                return ChooseButton(name: activity, onTap: () {});
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
