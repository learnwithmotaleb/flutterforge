import 'package:flutter/material.dart';

class SmartDrawer extends StatelessWidget {
  const SmartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 🔹 Header Section
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1976D2), Color(0xFF42A5F5)], // Deep blue to light blue
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(10),
              ),
            ),
            accountName: const Text(
              'UserName',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: const Text(
              'E-mail',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('assets/icon/user.png'),
              ),
            ),
          ),



          // 🔹 Legal Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'ABOUT US',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          // 🔹 Menu Section
          _buildTile('assets/icon/rating.png', 'Rate App', () {}),
          _buildTile('assets/icon/share.png', 'Share', () {}),
          _buildTile('assets/icon/questions.png', 'Feedback', () {}),
          _buildTile('assets/icon/more_app.png', 'More Apps', () {}),

          const Divider(),

          // 🔹 Legal Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'LEGAL',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          _buildTile('assets/icon/policy.png', 'Privacy Policy', () {}),
          _buildTile('assets/icon/condition.png', 'Terms & Conditions', () {}),

          const Divider(),

          // 🔹 Social Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'FOLLOW ME ON',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          _buildTile('assets/icon/linkedin.png', 'Linkedin', () {}),
          _buildTile('assets/icon/youtube.png', 'YouTube', () {}),
          _buildTile('assets/icon/facebook.png', 'Facebook', () {}),
          _buildTile('assets/icon/instagram.png', 'Instagram', () {}),
        ],
      ),
    );
  }

  ListTile _buildTile(String iconPath, String title, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        errorBuilder: (_, __, ___) => const Icon(Icons.help_outline), // fallback icon
      ),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
