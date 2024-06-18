import 'package:cloud_firestore/cloud_firestore.dart';

class Topic {
  final String id;
  final String topicName;

  Topic({
    required this.id,
    required this.topicName,
  });

  factory Topic.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Topic(
      id: doc.id,
      topicName: data['topicName'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'topicName': topicName,
    };
  }
}
