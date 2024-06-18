class TheoryContent {
  final String type; // 'text' or 'image'
  final String content; // The actual content, either text or image URL

  TheoryContent({required this.type, required this.content});

  factory TheoryContent.fromMap(Map<String, dynamic> data) {
    return TheoryContent(
      type: data['type'],
      content: data['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'content': content,
    };
  }
}
