import 'package:flutter/material.dart';
import 'modern_card.dart';

class AnimatedGridBody extends StatefulWidget {
  const AnimatedGridBody({super.key});

  @override
  State<AnimatedGridBody> createState() => _AnimatedGridBodyState();
}

class _AnimatedGridBodyState extends State<AnimatedGridBody> with SingleTickerProviderStateMixin {
  final List<String> imageUrls = [
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/unreal-engine/unreal-engine.png', 
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/unity/unity.png',
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/godot/godot.png',
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/flutter/flutter.png',
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/dart/dart.png',
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/python/python.png',
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/cpp/cpp.png',
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/android/android.png',
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/linux/linux.png',
    'https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/javascript/javascript.png',
  ];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      itemCount: imageUrls.length ~/ 2,
      itemBuilder: (context, index) {
        int imgIndex1 = index * 2;
        int imgIndex2 = index * 2 + 1;

        final double start = (index * 0.1).clamp(0.0, 1.0);
        final double end = (start + 0.6).clamp(0.0, 1.0);

        final bouncyAnimation = CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOutBack),
        );

        final fadeAnimation = CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOut),
        );

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 100 * (1 - bouncyAnimation.value)),
              child: Transform.scale(
                scale: 0.8 + (0.2 * bouncyAnimation.value),
                child: Opacity(
                  opacity: fadeAnimation.value.clamp(0.0, 1.0),
                  child: child,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: ModernCard(imageUrl: imageUrls[imgIndex1])),
                const SizedBox(width: 16),
                Expanded(child: ModernCard(imageUrl: imageUrls[imgIndex2])),
              ],
            ),
          ),
        );
      },
    );
  }
}