import 'package:math_app/models/topic.dart';

class Grade {
  final String id;
  final String title;
  final List<Topic> topics;

  const Grade({required this.id, required this.title, required this.topics});
}
