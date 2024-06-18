class ActivityType {
  final String id;
  final String title;
  final String type; // 'theory' or 'practice'
  final String content; // This can be a theory ID or practice content

  ActivityType({
    required this.id,
    required this.title,
    required this.type,
    required this.content,
  });

  factory ActivityType.fromFirestore(Map<String, dynamic> data) {
    return ActivityType(
      id: data['id'],
      title: data['title'],
      type: data['type'],
      content: data['content'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'content': content,
    };
  }
}
