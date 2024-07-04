class Equation {
  final String id;
  final String equation;
  final String solution;

  Equation({
    required this.id,
    required this.equation,
    required this.solution,
  });

  factory Equation.fromFirestore(Map<String, dynamic> data) {
    return Equation(
      id: data['id'],
      equation: data['equation'],
      solution: data['solution'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'equation': equation,
      'solution': solution,
    };
  }
}
