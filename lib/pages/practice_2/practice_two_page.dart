import 'package:flutter/material.dart';
import '../../widgets/practice_2/calculator_form.dart';

class PracticeTwoPage extends StatelessWidget {
  const PracticeTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 25, top: 5),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.indigo],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50), 
              ),
            ),
            child: const Column(
              children: [
                Text(
                  'Практическая работа',
                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '№ 1 - 1 - 2',
                  style: TextStyle(fontSize: 18, color: Colors.white70, letterSpacing: 2),
                ),
              ],
            ),
          ),
          
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: CalculatorForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}