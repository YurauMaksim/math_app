import 'package:cloud_firestore/cloud_firestore.dart';

class Chapter {
  final String id;
  final String title;

  Chapter({
    required this.id,
    required this.title,
  });

  factory Chapter.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Chapter(
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
