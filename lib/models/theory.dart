import 'package:flutter/material.dart';

class Theory {
  final String id;
  final String subjectId;
  final String chapterId;
  final String gradeId;
  final String topicId;
  final String title;
  final String subtitle;
  final List<String> paragraphs;
  final List<String> imagesUrl;

  const Theory({
    required this.id,
    required this.subjectId,
    required this.chapterId,
    required this.gradeId,
    required this.topicId,
    required this.title,
    this.subtitle = 'Subtitle',
    required this.paragraphs,
    required this.imagesUrl, // it has to be done as not required because it doesn't necessarily have an image
  });
}
