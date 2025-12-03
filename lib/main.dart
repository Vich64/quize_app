import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';
import 'model/quiz.dart';

void main() {
  // 1 - Load the quiz data
  const quiz = Quiz(
    title: 'Simple Flutter Quiz',
    questions: [
      Question(
        title: 'Who is the best teacher?',
        options: ['Ronan', 'Hongly', 'Leangsiv'],
        correctIndex: 0,
      ),
      Question(
        title: 'What is the best color?',
        options: ['Blue', 'Red', 'Green'],
        correctIndex: 2,
      ),
    ],
  );

  // 2 - Display the quiz
  runApp(QuizApp(quiz: quiz));
}
