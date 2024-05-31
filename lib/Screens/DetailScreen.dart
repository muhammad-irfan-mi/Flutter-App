import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String rollNo;
  final String semester;
  final String gpa;
  final String address;
  final String imagePath;

  DetailScreen({
    required this.name,
    required this.rollNo,
    required this.semester,
    required this.gpa,
    required this.address,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
             Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/login.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('Name: $name'),
            SizedBox(height: 10),
            Text('Roll Number: $rollNo'),
            SizedBox(height: 10),
            Text('Semester: $semester'),
            SizedBox(height: 10),
            Text('GPA: $gpa'),
            SizedBox(height: 10),
            Text('Address: $address'),
          ],
        ),
      ),
    );
  }
}
