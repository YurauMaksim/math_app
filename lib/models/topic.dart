import 'package:math_app/models/activity_type.dart';
import 'package:math_app/models/chapter.dart';

class Topic {
  final String topicName;
  final List<ActivityType> activityTypes;

  const Topic({required this.topicName, required this.activityTypes});
}
