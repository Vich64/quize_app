import 'package:flutter/material.dart';
import '../model/quiz.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

class QuizApp extends StatefulWidget {
  final Quiz quiz;
  const QuizApp({super.key, required this.quiz});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String _screen = 'welcome';
  int _index = 0;
  final List<int> _answers = [];

  void _start() {
    setState(() {
      _screen = 'question';
      _index = 0;
      _answers.clear();
    });
  }

  void _answer(int selectedIndex) {
    _answers.add(selectedIndex);
    if (_index + 1 < widget.quiz.questions.length) {
      setState(() => _index++);
    } else {
      setState(() => _screen = 'result');
    }
  }

  void _restart() {
    setState(() {
      _screen = 'welcome';
      _index = 0;
      _answers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF1976D2),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF2196F3),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Builder(
                builder: (_) {
                  if (_screen == 'welcome') {
                    return WelcomeScreen(onStart: _start);
                  }
                  if (_screen == 'question') {
                    final q = widget.quiz.questions[_index];
                    return QuestionScreen(
                      question: q,
                      index: _index,
                      total: widget.quiz.questions.length,
                      onSelect: _answer,
                    );
                  }
                  return ResultScreen(
                    quiz: widget.quiz,
                    answers: _answers,
                    onRestart: _restart,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
