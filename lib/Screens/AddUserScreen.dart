import 'package:flutter/material.dart';
import 'user_detail.dart'; // Import the User model

class AddUserScreen extends StatefulWidget {
  final Function(User) onAddUser;

  AddUserScreen({required this.onAddUser});

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _rollNo = '';
  String _semester = '';
  String _gpa = '';
  String _address = '';

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final newUser = User(
        name: _name,
        rollNo: _rollNo,
        semester: _semester,
        gpa: _gpa,
        address: _address,
      );
      widget.onAddUser(newUser);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  _name = value ?? '';
                },
                validator: (value) {
                  return value?.isEmpty ?? true ? 'Please enter a name' : null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Roll No'),
                onSaved: (value) {
                  _rollNo = value ?? '';
                },
                validator: (value) {
                  return value?.isEmpty ?? true ? 'Please enter a roll number' : null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Semester'),
                onSaved: (value) {
                  _semester = value ?? '';
                },
                validator: (value) {
                  return value?.isEmpty ?? true ? 'Please enter a semester' : null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'GPA'),
                onSaved: (value) {
                  _gpa = value ?? '';
                },
                validator: (value) {
                  return value?.isEmpty ?? true ? 'Please enter a GPA' : null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) {
                  _address = value ?? '';
                },
                validator: (value) {
                  return value?.isEmpty ?? true ? 'Please enter an address' : null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
