// home_screen.dart

import 'package:flutter/material.dart';
import 'package:grade_book_management/Screens/ViewList.dart';
import 'ViewList.dart'; // Import the ViewList screen
import 'user_detail.dart'; // Import the User model

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _rollNoController = TextEditingController();
  TextEditingController _semesterController = TextEditingController();
  TextEditingController _gpaController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Implement image picker functionality
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.camera_alt, size: 50),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _rollNoController,
                  decoration: InputDecoration(
                    labelText: 'Roll Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your roll number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _semesterController,
                  decoration: InputDecoration(
                    labelText: 'Semester',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your semester';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _gpaController,
                  decoration: InputDecoration(
                    labelText: 'GPA',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your GPA';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _addressController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String name = _nameController.text;
                        String rollNo = _rollNoController.text;
                        String semester = _semesterController.text;
                        String gpa = _gpaController.text;
                        String address = _addressController.text;

                        setState(() {
                          users.add(User(
                            name: name,
                            rollNo: rollNo,
                            semester: semester,
                            gpa: gpa,
                            address: address,
                          ));
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewList(users: users),
                          ),
                        );

                        _nameController.clear();
                        _rollNoController.clear();
                        _semesterController.clear();
                        _gpaController.clear();
                        _addressController.clear();
                      }
                    },
                    child: Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
