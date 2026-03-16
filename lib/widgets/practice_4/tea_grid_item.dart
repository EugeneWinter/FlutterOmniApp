// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../pages/practice_4/detail_tea_page.dart';

class TeaGridItem extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final int price;
  final Color glowColor;

  const TeaGridItem({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    final String heroTag = 'tea_image_$index';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, __, ___) => DetailTeaPage(
              heroTag: heroTag,
              title: title,
              price: price,
              glowColor: glowColor,
            ),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF212325),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: glowColor.withOpacity(0.1), spreadRadius: 1, blurRadius: 8),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: heroTag,
                  child: Icon(Icons.local_cafe, size: 100, color: glowColor),
                ),
              ),
            ),
            
            const SizedBox(height: 10),
            
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.white60, fontSize: 14)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$price ₽', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.greenAccent.shade700, borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}