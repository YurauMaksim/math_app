import 'package:cloud_firestore/cloud_firestore.dart';

class Grade {
  final String id;
  final String title;

  Grade({
    required this.id,
    required this.title,
  });

  factory Grade.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Grade(
      id: doc.id,
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
    };
  }
}
