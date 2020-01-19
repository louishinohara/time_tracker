import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_form.dart';
import 'package:time_tracker/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({@required this.auth});
  // Creating a new class for the main.dart
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Used to build the page
      appBar: AppBar(
        title: Text('Sign In'), // Text displayed on app bar
        elevation: 2,
      ),
      body: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInForm(auth: auth),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

}
