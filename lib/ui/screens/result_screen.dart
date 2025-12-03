import 'package:flutter/material.dart';
import '../../model/quiz.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final List<int> answers;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.answers,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final total = quiz.questions.length;
    int score = 0;
    for (var i = 0; i < total; i++) {
      if (answers[i] == quiz.questions[i].correctIndex) score++;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Text(
          'You answered $score on $total !',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemCount: total,
            separatorBuilder: (_, __) =>
                const Divider(height: 24, color: Colors.white24),
            itemBuilder: (context, i) {
              final q = quiz.questions[i];
              final user = answers[i];
              final correct = q.correctIndex;
              final isCorrect = user == correct;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isCorrect ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${i + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          q.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...q.options.asMap().entries.map((e) {
                          final idx = e.key;
                          final text = e.value;
                          Color color = Colors.white;
                          String prefix = '';
                          if (idx == correct) {
                            color = Colors.greenAccent;
                          }
                          if (idx == user) {
                            prefix = isCorrect ? '✓ ' : '✗ ';
                            color = isCorrect
                                ? Colors.greenAccent
                                : Colors.redAccent;
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              '$prefix$text',
                              style: TextStyle(color: color),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        AppButton('Restart Quiz', onTap: onRestart, icon: Icons.refresh),
        const SizedBox(height: 24),
      ],
    );
  }
}
