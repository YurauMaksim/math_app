class TheoryContentBlock {
  final String type; // 'text' or 'image'
  final String content; // text content or image URL

  TheoryContentBlock({
    required this.type,
    required this.content,
  });

  factory TheoryContentBlock.fromFirestore(Map<String, dynamic> data) {
    return TheoryContentBlock(
      type: data['type'],
      content: data['content'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'content': content,
    };
  }
}
