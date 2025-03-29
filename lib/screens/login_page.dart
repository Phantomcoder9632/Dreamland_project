import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    final String username = usernameController.text.trim();
    final String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password!')),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://yourdomain.com/api/login.php'),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data['status'] == 'success') {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid Credentials!')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error! Please try again later.')),
        );
      }
    } catch (error) {
      print('Login error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error! Check your connection.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginUser,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
