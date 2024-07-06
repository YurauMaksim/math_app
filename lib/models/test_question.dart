class TestQuestion {
  final String id;
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String imageUrl;

  TestQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.imageUrl,
  });

  factory TestQuestion.fromFirestore(Map<String, dynamic> data) {
    return TestQuestion(
      id: data['id'],
      question: data['question'],
      options: List<String>.from(data['options']),
      correctAnswer: data['correctAnswer'],
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'imageUrl': imageUrl,
    };
  }
}
