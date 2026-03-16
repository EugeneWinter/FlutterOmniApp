// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizController extends ChangeNotifier {
  final List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;
  
  bool isAnswered = false;
  int? selectedAnswerIndex;

  QuizController(this.questions);

  bool get isQuizEnd => currentQuestionIndex == questions.length - 1;

  void nextQuestion(int selectedIndex, BuildContext context) async {
    if (isAnswered) return;

    isAnswered = true;
    selectedAnswerIndex = selectedIndex;
    
    if (questions[currentQuestionIndex].correctAnswerIndex == selectedIndex) {
      score++;
    }
    
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (isQuizEnd) {
      showResultDialog(context);
    } else {
      currentQuestionIndex++;
    }

    isAnswered = false;
    selectedAnswerIndex = null;
    notifyListeners();
  }

  void resetQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    isAnswered = false;
    selectedAnswerIndex = null;
    notifyListeners();
  }

  void showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2C),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Результат', style: TextStyle(color: Colors.white, fontSize: 22)),
        content: Text(
          'Ваш счет: $score/${questions.length}',
          style: const TextStyle(color: Colors.white70, fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              resetQuiz();
              Navigator.of(context).pop();
            },
            child: const Text('Начать заново', style: TextStyle(color: Colors.greenAccent, fontSize: 18)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('Выйти', style: TextStyle(color: Colors.redAccent, fontSize: 18)),
          ),
        ],
      ),
    );
  }
}