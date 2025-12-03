import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/app_button.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final int index;
  final int total;
  final void Function(int) onSelect;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.index,
    required this.total,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Text(
          question.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Question ${index + 1} of $total',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
        const SizedBox(height: 32),
        ...question.options.asMap().entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AppButton(entry.value, onTap: () => onSelect(entry.key)),
          ),
        ),
      ],
    );
  }
}
