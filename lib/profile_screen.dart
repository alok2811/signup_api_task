import 'package:flutter/material.dart';
import 'package:tanu_interview/signup_model.dart';

class ProfileScreen extends StatelessWidget {
  final SignupModel signupModel;

  ProfileScreen({required this.signupModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
                'Name: ${signupModel.body?.firstName} ${signupModel.body?.lastName}'),
            Text('Username: ${signupModel.body?.username}'),
            Text('Email: ${signupModel.body?.email}'),
            Text('Phone: ${signupModel.body?.phone}'),
            // Display other fields as needed
          ],
        ),
      ),
    );
  }
}
