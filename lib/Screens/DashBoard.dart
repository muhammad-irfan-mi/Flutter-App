import 'package:flutter/material.dart';
import 'package:grade_book_management/Screens/DetailScreen.dart';
import 'package:grade_book_management/Screens/ViewList.dart';
import './HomeScreen.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        children: [
          _buildDashboardItem(
            icon: Icons.home,
            label: 'Home',
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()), // Navigating to HomeScreen
              );
            },
          ),
          _buildDashboardItem(
            icon: Icons.view_list,
            label: 'View List',
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewList(users: const [],)), // Navigating to HomeScreen
              );
            },
          ),
          _buildDashboardItem(
            icon: Icons.list_alt,
            label: 'Detail List',
            onTap: () {
              // Navigate to the Detail List Screen
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(name: '', rollNo: '', gpa: '', semester: '', imagePath: '', address: '',)), // Navigating to HomeScreen
              );
            },
          ),
          _buildDashboardItem(
            icon: Icons.settings,
            label: 'Settings',
            onTap: () {
              // Navigate to the Settings Screen
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem({required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.grey[300], // Change color on hover
      child: Material(
        color: Colors.blue, // Initial color of the icon
        borderRadius: BorderRadius.circular(10.0),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50.0, color: Colors.white), // Colorful icon
              SizedBox(height: 10.0),
              Text(label, style: TextStyle(fontSize: 16.0, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
