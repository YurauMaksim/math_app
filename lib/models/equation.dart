class Equation {
  final String id;
  final String equation; // Keep this if you still want to display text
  final String solution;
  final String imageUrl; // New field for image URL

  Equation({
    required this.id,
    required this.equation,
    required this.solution,
    required this.imageUrl,
  });

  factory Equation.fromFirestore(Map<String, dynamic> data) {
    return Equation(
      id: data['id'],
      equation: data['equation'],
      solution: data['solution'],
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'equation': equation,
      'solution': solution,
      'imageUrl': imageUrl,
    };
  }
}
