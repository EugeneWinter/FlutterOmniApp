import 'package:flutter/material.dart';
import '../../widgets/practice_1/custom_drawer.dart';
import '../../widgets/practice_1/animated_grid_body.dart';

class PracticeOnePage extends StatelessWidget {
  const PracticeOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1550684848-fac1c5b4e853?q=80&w=1000&auto=format&fit=crop'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('ПР-1-1-1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              centerTitle: true,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu_open_rounded, color: Colors.white, size: 28),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              actions: [
                IconButton(icon: const Icon(Icons.info_outline, color: Colors.white), onPressed: () {}),
                IconButton(icon: const Icon(Icons.games_outlined, color: Colors.white), onPressed: () {}),
                const SizedBox(width: 10),
              ],
            ),
            const Expanded(
              child: AnimatedGridBody(),
            ),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}