import 'package:flutter/material.dart';
import 'package:grade_book_management/Screens/DetailScreen.dart';
import 'package:grade_book_management/Screens/ViewList.dart';
import 'package:grade_book_management/main.dart';
import './HomeScreen.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          Container(
            width: 170.0,
            color: Colors.lightBlue, // Background color of the sidebar
            child: ListView(
              children: [
                DashboardItem(
                  icon: Icons.home,
                  label: 'Home',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen()), // Navigating to HomeScreen
                    );
                  },
                ),
                DashboardItem(
                  icon: Icons.view_list,
                  label: 'View List',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewList(
                              users: const [])), // Navigating to ViewList
                    );
                  },
                ),
                DashboardItem(
                  icon: Icons.list_alt,
                  label: 'Detail List',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                              name: '',
                              rollNo: '',
                              gpa: '',
                              semester: '',
                              imagePath: '',
                              address: '')), // Navigating to DetailScreen
                    );
                  },
                ),
                DashboardItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {
                    // Navigate to the Settings Screen
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  const Text(
                    'Grade Book Management',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginApp()), // Navigating to LoginApp
                      );
                    },
                    child: const Text('Back to Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue, // Background color of the button
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16), // Set padding for the button
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  DashboardItem({required this.icon, required this.label, required this.onTap});

  @override
  _DashboardItemState createState() => _DashboardItemState();
}

class _DashboardItemState extends State<DashboardItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.grey[300], // Change color on hover
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: _isHovered
                      ? Colors.blue
                      : Colors.white, // Background color of the icon
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Icon(widget.icon,
                      size: 24.0,
                      color: _isHovered
                          ? Colors.white
                          : Colors.blue), // Icon color
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                widget.label,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white), // Fixed text color logic
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Grade Book Management',
    home: Dashboard(),
  ));
}
