// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../widgets/practice_4/custom_bottom_bar.dart';
import '../../widgets/practice_4/tea_grid_item.dart';
import '../../widgets/practice_1/custom_drawer.dart';

class MainTeaPage extends StatefulWidget {
  const MainTeaPage({super.key});

  @override
  State<MainTeaPage> createState() => _MainTeaPageState();
}

class _MainTeaPageState extends State<MainTeaPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.sort_rounded), 
                      color: Colors.white.withOpacity(0.7),
                      iconSize: 35,
                      splashRadius: 25, 
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.notifications),
                    color: Colors.greenAccent,
                    iconSize: 30,
                    splashRadius: 25,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                'Лесной дом\nмобильных приложений', 
                style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 25),
              
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                decoration: BoxDecoration(color: const Color(0xFF212325), borderRadius: BorderRadius.circular(15)),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.greenAccent, size: 28),
                    SizedBox(width: 15),
                    Text('Чай или кофе...', style: TextStyle(color: Colors.white54, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.greenAccent,
                labelColor: Colors.greenAccent,
                unselectedLabelColor: Colors.white54,
                tabAlignment: TabAlignment.start,
                labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: 'Зеленый чай'),
                  Tab(text: 'Черный чай'),
                  Tab(text: 'Красный чай'),
                  Tab(text: 'Белый чай'),
                ],
              ),
              const SizedBox(height: 20),
              
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildGrid(Colors.greenAccent),
                    _buildGrid(Colors.orangeAccent),
                    _buildGrid(Colors.redAccent),
                    _buildGrid(Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(Color glowColor) {
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
        return TeaGridItem(
          index: index + glowColor.value,
          title: 'Сорт чая ${index + 1}',
          subtitle: 'Лучший вкус',
          price: 99 + (index * 50),
          glowColor: glowColor,
        );
      },
    );
  }
}