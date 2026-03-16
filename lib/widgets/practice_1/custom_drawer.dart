// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E1E),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey.shade900, Colors.black87],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text('Практическая работа', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            accountEmail: const Text('Разработка мобильных приложений', style: TextStyle(color: Colors.white70)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blueAccent.withOpacity(0.8),
              child: const Icon(Icons.person, size: 40, color: Colors.white),
            ),
          ),
          _buildDrawerItem(icon: Icons.favorite, text: 'Избранное'),
          _buildDrawerItem(icon: Icons.people, text: 'Друзья', badgeCount: 7),
          _buildDrawerItem(icon: Icons.share_location, text: 'Места'),
          _buildDrawerItem(icon: Icons.notifications, text: 'Уведомления', badgeCount: 5),
          _buildDrawerItem(icon: Icons.settings, text: 'Настройки', badgeCount: 4),
          const Divider(color: Colors.white24, thickness: 1, height: 20),
          _buildDrawerItem(icon: Icons.photo_camera, text: 'Фотографии', badgeCount: 9),
          const Divider(color: Colors.white24, thickness: 1, height: 20),
          _buildDrawerItem(
            icon: Icons.exit_to_app, 
            text: 'Выйти', 
            iconColor: Colors.redAccent, 
            textColor: Colors.redAccent,
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon, 
    required String text, 
    int? badgeCount, 
    Color iconColor = Colors.white70,
    Color textColor = Colors.white,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(text, style: TextStyle(color: textColor, fontSize: 15)),
      trailing: badgeCount != null
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                badgeCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )
          : null,
      onTap: onTap ?? () {},
    );
  }
}