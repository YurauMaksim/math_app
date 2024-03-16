import 'package:flutter/material.dart';
import 'package:math_app/data/grades_data.dart';
import 'package:math_app/data/subjects_data.dart';
import 'package:math_app/models/chapter.dart';
import 'package:math_app/models/subject.dart';
import 'package:math_app/models/subject_item.dart';

class SubjectScreen extends StatelessWidget {
  final Subject subject;

  const SubjectScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('nothing is in here',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          const SizedBox(
            height: 16,
          ),
          Text(
            "try to choose something new",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.title),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final chapter in subject.chapters)
                Column(
                  children: [
                    Text(chapter.title),
                    Column(
                      children: [
                        for (final grade in chapter.grades)
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ExpansionTile(
                              title: Text(grade.title),
                              children: [
                                for (final topic in grade.topics)
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: ExpansionTile(
                                      title: Text(topic.topicName),
                                      children: [
                                        for (final activity
                                            in topic.activityTypes)
                                          OutlinedButton(
                                              child: Text(activity.title),
                                              onPressed: () => {}),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    )
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

//------------It creates almost perfect grid view
// body: Row(
//           children: [
//             for (final chapter in subject.chapters)
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       Text(chapter.title),
//                       for (final grade in chapter.grades)
//                         Row(
//                           children: [
//                             Text(grade.title),
//                             for (final activity in chapter.activityType)
//                               Text(activity.title)
//                           ],
//                         )
//                     ],
//                   )
//                 ],
//               )
//           ],
//         )