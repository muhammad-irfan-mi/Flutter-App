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
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath), // Display the image
            SizedBox(height: 20),
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
