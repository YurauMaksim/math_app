import 'package:math_app/models/theory_content.dart';

class Theory {
  final String id;
  final String title;
  final List<TheoryContent> contents;

  Theory({required this.id, required this.title, required this.contents});

  factory Theory.fromMap(Map<String, dynamic> data) {
    return Theory(
      id: data['id'],
      title: data['title'],
      contents: (data['contents'] as List)
          .map((contentData) => TheoryContent.fromMap(contentData))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'contents': contents.map((content) => content.toMap()).toList(),
    };
  }
}
