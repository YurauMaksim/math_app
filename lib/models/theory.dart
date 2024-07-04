import 'package:math_app/models/theory_content.dart';

class Theory {
  final String id;
  final String title;
  final List<TheoryContentBlock> contentBlocks;
  final bool isLocal; // Indicates if the images are local

  Theory({
    required this.id,
    required this.title,
    required this.contentBlocks,
    required this.isLocal,
  });

  factory Theory.fromFirestore(String id, Map<String, dynamic> data) {
    return Theory(
      id: id,
      title: data['title'] ?? '',
      contentBlocks: (data['contentBlocks'] as List)
          .map((block) => TheoryContentBlock.fromFirestore(block))
          .toList(),
      isLocal: data['isLocal'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'contentBlocks':
          contentBlocks.map((block) => block.toFirestore()).toList(),
      'isLocal': isLocal,
    };
  }
}
