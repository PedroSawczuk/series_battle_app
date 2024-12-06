import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:series_battle/views/homePage.dart'; // Importe sua HomePage
import 'package:series_battle/views/rankingPage.dart'; // Importe sua ComparisonPage

class DrawerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red.shade800,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.tv, size: 30, color: Colors.red.shade800),
                ),
                SizedBox(width: 16),
                Text(
                  'Series Battle',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.red.shade800),
            title: Text('Home'),
            onTap: () {
              Get.offAll(HomePage()); // Navegar para a HomePage
            },
          ),
          ListTile(
            leading: Icon(Icons.equalizer, color: Colors.red.shade800),
            title: Text('Ranking'),
            onTap: () {
              Get.offAll(RankingPage()); // Navegar para a HomePage
            },
          ),

        ],
      ),
    );
  }
}
