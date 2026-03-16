import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/question.dart';
import '../../services/quiz_controller.dart';
import 'quiz_page.dart';

class PracticeThreeWrapper extends StatefulWidget {
  const PracticeThreeWrapper({super.key});

  @override
  State<PracticeThreeWrapper> createState() => _PracticeThreeWrapperState();
}

class _PracticeThreeWrapperState extends State<PracticeThreeWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context, 
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 800),
            pageBuilder: (_, __, ___) => ChangeNotifierProvider(
              create: (context) => QuizController(quizQuestions),
              child: const QuizPage(),
            ),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
          )
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: const Icon(Icons.quiz_rounded, size: 100, color: Colors.deepPurpleAccent),
        ),
      ),
    );
  }
}