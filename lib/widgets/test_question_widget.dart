import 'package:flutter/material.dart';
import 'package:math_app/models/test_question.dart';

class TestQuestionWidget extends StatefulWidget {
  final TestQuestion question;
  final void Function(String answer) onSubmitAnswer;

  TestQuestionWidget({
    required this.question,
    required this.onSubmitAnswer,
  });

  @override
  _TestQuestionWidgetState createState() => _TestQuestionWidgetState();
}

class _TestQuestionWidgetState extends State<TestQuestionWidget> {
  String? _selectedOption;
  bool _isAnswerSaved = false;

  void _submitAnswer() {
    if (_selectedOption != null) {
      widget.onSubmitAnswer(_selectedOption!);
      setState(() {
        _isAnswerSaved = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.question.question, style: TextStyle(fontSize: 18)),
            for (var option in widget.question.options)
              RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
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
