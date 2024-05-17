import 'package:flutter/material.dart';
import 'package:grade_book_management/Screens/AddUserScreen.dart';
import 'package:grade_book_management/Screens/UserDetailScreen.dart';
import 'user_detail.dart'; // Import the User model

class ViewList extends StatefulWidget {
  final List<User> users;

  ViewList({required this.users});

  @override
  _ViewListState createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  late List<User> _users;

  @override
  void initState() {
    super.initState();
    _users = widget.users;
  }

  void _addUser(User user) {
    setState(() {
      _users.add(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View List'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('GPA')),
          ],
          rows: _users.map((user) {
            return DataRow(
              cells: [
                DataCell(Text(user.name)),
                DataCell(Text(user.gpa)),
              ],
              onSelectChanged: (selected) {
                if (selected != null && selected) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailScreen(user: user),
                    ),
                  );
                }
              },
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUserScreen(onAddUser: _addUser),
            ),
          );
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.blueGrey),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
