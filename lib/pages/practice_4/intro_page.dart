// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'main_tea_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xFF2C5364),
              Color(0xFF203A43),
              Color(0xFF0F2027),
            ],
            center: Alignment.topRight,
            radius: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Icon(
              Icons.spa_rounded,
              size: 100, 
              color: Colors.greenAccent.withOpacity(0.8)
            ),
            const SizedBox(height: 20),
            const Text(
              'Лесной дом',
              style: TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            Text(
              'Новое чайное пространство!',
              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 18),
            ),
            const Spacer(),
            
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainTeaPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 10,
                  shadowColor: Colors.greenAccent,
                ),
                child: const Text(
                  'ПОСМОТРЕТЬ',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}