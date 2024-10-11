import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanu_interview/profile_screen.dart';
import 'package:tanu_interview/signup_model.dart';

// Your SignupModel classes here (SignupModel, Body)...

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final Dio _dio = Dio();
  final ImagePicker _picker = ImagePicker();

  String name = '';
  String username = '';
  String email = '';
  String password = '';
  String countryCode = '91'; // Default country code
  String phone = '';
  String deviceType = '0';
  String deviceToken = 'trtrtrt'; // Replace with actual token if needed
  File? _imageFile; // Store the picked image file

  Future<void> signup() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        // Prepare the data for the request
        FormData formData = FormData.fromMap({
          "name": name,
          "username": username,
          "type": 1,
          "email": email,
          "password": password,
          "countryCode": countryCode,
          "phone": phone,
          "deviceType": deviceType,
          "deviceToken": deviceToken,
          "image": _imageFile != null
              ? await MultipartFile.fromFile(_imageFile!.path)
              : null,
        });

        final response = await _dio.post(
          'http://122.176.141.23:1998/api/signup',
          data: formData,
          options: Options(
            headers: {
              "securitykey": "1y9WKFREG4z61pruVilZvoeohgVbdfXV",
            },
          ),
        );

        // Handle success response
        if (response.data['success']) {
          final signupModel = SignupModel.fromJson(response.data);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(signupModel: signupModel),
            ),
          );
        } else {
          // Handle failure
          print("Signup failed: ${response.data['message']}");
        }
      } on DioException catch (e) {
        // Handle Dio errors
        print("Dio error: ${e.message}");
      }
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) => name = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) => username = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null ||
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) => email = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  onSaved: (value) => password = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) => phone = value!,
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _imageFile == null
                        ? Center(child: Text('Select Image'))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: signup,
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
