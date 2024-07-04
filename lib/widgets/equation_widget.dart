import 'package:flutter/material.dart';
import 'package:math_app/models/equation.dart';

class EquationWidget extends StatefulWidget {
  final Equation equation;
  final void Function(String answer) onSubmitAnswer;

  EquationWidget({
    required this.equation,
    required this.onSubmitAnswer,
  });

  @override
  _EquationWidgetState createState() => _EquationWidgetState();
}

class _EquationWidgetState extends State<EquationWidget> {
  final _controller = TextEditingController();
  bool _isAnswerSaved = false;

  void _submitAnswer() {
    widget.onSubmitAnswer(_controller.text);
    setState(() {
      _isAnswerSaved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.equation.equation, style: TextStyle(fontSize: 18)),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ваш ответ'),
              onChanged: (value) {
                setState(() {
                  _isAnswerSaved = false;
                });
              },
            ),
            ElevatedButton(
              onPressed: _submitAnswer,
              child: Text('Сохранить ответ'),
            ),
            if (_isAnswerSaved)
              Text(
                'Ответ сохранён',
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
