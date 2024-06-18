import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Subject {
  final String id;
  final String title;
  final Color color;

  Subject({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  factory Subject.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Subject(
      id: doc.id,
      title: data['title'] ?? '',
      color:
          Color(int.parse(data['color'] ?? '0xFFFFA500')), // Default to orange
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'color': color.value.toString(),
    };
  }
}
