class Question {
  final String title;
  final List<String> options;
  final int correctIndex;

  const Question({
    required this.title,
    required this.options,
    required this.correctIndex,
  });
}

class Quiz {
  final String title;
  final List<Question> questions;

  const Quiz({required this.title, required this.questions});
}
