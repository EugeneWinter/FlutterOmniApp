// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../widgets/practice_5/fruit_grid_item.dart';
import '../../widgets/practice_1/custom_drawer.dart';

class MainFruitPage extends StatelessWidget {
  const MainFruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFF1A1A1A),
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.sort, color: Colors.orangeAccent, size: 30),
              splashRadius: 25,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.orangeAccent, size: 28), 
              splashRadius: 25,
              onPressed: () {}
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Практическая работа', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text('Разработка МП', style: TextStyle(color: Colors.white54, fontSize: 16)),
              const SizedBox(height: 25),
              
              TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                splashBorderRadius: BorderRadius.circular(30), 
                overlayColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.1)),
                indicatorSize: TabBarIndicatorSize.label, 
                indicator: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(30)),
                labelColor: Colors.orangeAccent,
                unselectedLabelColor: Colors.white54,
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.symmetric(horizontal: 6), 
                tabs: [
                  _buildCustomTab('Персики'),
                  _buildCustomTab('Яблоки'),
                  _buildCustomTab('Бананы'),
                  _buildCustomTab('Виноград'),
                ],
              ),
              const SizedBox(height: 20),
              
              Expanded(
                child: TabBarView(
                  children: [
                    _buildFruitGrid('🍑', 'Персик'),
                    _buildFruitGrid('🍏', 'Яблоко'),
                    _buildFruitGrid('🍌', 'Банан'),
                    _buildFruitGrid('🍇', 'Виноград'),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          color: const Color(0xFF1A1A1A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.person, color: Colors.orangeAccent, size: 30),
              const Icon(Icons.search, color: Colors.white54, size: 30),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(color: Colors.orangeAccent, shape: BoxShape.circle),
                child: const Icon(Icons.shopping_cart, color: Colors.white, size: 25),
              ),
              const Icon(Icons.notifications_none, color: Colors.white54, size: 30),
              const Icon(Icons.settings, color: Colors.white54, size: 30),
            ],
          ),
        ),
      ),
    );
  }

  Tab _buildCustomTab(String text) {
    return Tab(
      height: 45,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22), 
        alignment: Alignment.center,
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildFruitGrid(String emoji, String title) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return FruitGridItem(index: index, emoji: emoji, title: title);
      },
    );
  }
}