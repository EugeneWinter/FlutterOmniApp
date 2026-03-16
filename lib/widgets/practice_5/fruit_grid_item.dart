// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../pages/practice_5/detail_fruit_page.dart';

class FruitGridItem extends StatelessWidget {
  final int index;
  final String emoji;
  final String title;

  const FruitGridItem({
    super.key,
    required this.index,
    required this.emoji,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFruitPage(emoji: emoji, title: title),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF2B2B2B),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 1, blurRadius: 8),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 80)),
              ),
            ),
            const SizedBox(height: 10),
            Text('$title № ${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('$title № ${index + 1}!', style: const TextStyle(color: Colors.white54, fontSize: 12)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('75 ₽', style: TextStyle(color: Colors.yellowAccent, fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.shopping_cart_outlined, color: Colors.greenAccent.shade400, size: 24),
              ],
            )
          ],
        ),
      ),
    );
  }
}