// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'practice_1/practice_one_page.dart';
import 'practice_2/practice_two_page.dart';
import 'practice_3/practice_three_wrapper.dart';
import 'practice_4/intro_page.dart';
import 'practice_5/main_fruit_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        scrolledUnderElevation: 0.0,
        surfaceTintColor: Colors.transparent,
        
        title: const Text('Все Практические', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(milliseconds: 400 + (index * 100)),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 50 * (1 - value)),
                child: Opacity(opacity: value, child: child),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: const Color(0xFF2C2C2C),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                  child: Text('${index + 1}', style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                ),
                title: Text('Практическая работа №${index + 1}', style: const TextStyle(fontSize: 18)),
                
                subtitle: Text(
                  index == 0 ? 'Карточки' : 
                  index == 1 ? 'Калькулятор депозита' :
                  index == 2 ? 'Викторина' : 
                  index == 3 ? 'Чайный магазин' : 
                  index == 4 ? 'Фрукты' : 
                  'В процессе разработки 🛠'
                ),
                
                trailing: Icon(
                  index == 5 ? Icons.lock_clock : Icons.arrow_forward_ios, 
                  size: 16, color: index == 5 ? Colors.orangeAccent : Colors.grey
                ),
                onTap: () {
                  if (index == 0) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PracticeOnePage()));
                  } else if (index == 1) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PracticeTwoPage()));
                  } else if (index == 2) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PracticeThreeWrapper()));
                  } else if (index == 3) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroPage()));
                  } else if (index == 4) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainFruitPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(Icons.construction, color: Colors.orangeAccent),
                            SizedBox(width: 12),
                            Text(
                              'Эта практика еще пишется...',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        backgroundColor: const Color(0xFF2C2C2C),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.orangeAccent.withOpacity(0.5), width: 1),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}