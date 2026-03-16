// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/quiz_controller.dart';
import '../../widgets/practice_1/custom_drawer.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<QuizController>();
    final question = controller.questions[controller.currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('ПР-1-1-3', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: const [
          Icon(Icons.person_outline, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.notifications_active_outlined, color: Colors.redAccent),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (controller.currentQuestionIndex + 1) / controller.questions.length,
            backgroundColor: Colors.grey.shade800,
            color: Colors.deepPurpleAccent,
            minHeight: 4,
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      question.text,
                      key: ValueKey<int>(controller.currentQuestionIndex),
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  ...List.generate(question.options.length, (index) {
                    final isSelected = controller.selectedAnswerIndex == index;
                    final isCorrect = index == question.correctAnswerIndex;
                    
                    Color buttonColor = const Color(0xFF2C2C2C);
                    if (controller.isAnswered) {
                      if (isCorrect) {
                        buttonColor = Colors.green.shade700;
                      } else if (isSelected) {
                        buttonColor = Colors.red.shade700;
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () => controller.nextQuestion(index, context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            elevation: isSelected ? 8 : 2,
                          ),
                          child: Text(
                            question.options[index],
                            style: const TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _CustomBottomNavBar(),
    );
  }
}

class _CustomBottomNavBar extends StatefulWidget {
  const _CustomBottomNavBar();

  @override
  State<_CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<_CustomBottomNavBar> {
  int iconSelectedIndex = 0;
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.search,
    Icons.add_box_outlined,
    Icons.person_outline,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (index) {
          final isSelected = iconSelectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => iconSelectedIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutExpo,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: isSelected ? const Border(top: BorderSide(width: 3, color: Colors.deepPurpleAccent)) : null,
                gradient: isSelected ? LinearGradient(
                  colors: [Colors.deepPurpleAccent.withOpacity(0.3), Colors.transparent],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                ) : null,
              ),
              child: Icon(
                icons[index],
                size: 30,
                color: isSelected ? Colors.deepPurpleAccent : Colors.grey.shade600,
              ),
            ),
          );
        }),
      ),
    );
  }
}