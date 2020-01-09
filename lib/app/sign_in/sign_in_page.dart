import 'package:flutter/material.dart';

import 'package:time_tracker/common_widgets/custom_raised_button.dart';
import './sign_in_button.dart';

class SignInPage extends StatelessWidget {
  // Creating a new class for the main.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Used to build the page
      appBar: AppBar(
        title: Text('Time Tracker'), // Text displayed on app bar
        elevation: 2,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildContent() {
    // Set return type to be a widget
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // A container can specify a widget child
        children: <Widget>[
          // A column has children which is a list of widgets
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 48),
          SignInButton(
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          Text('or',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go Anonymously',
            textColor: Colors.white,
            color: Colors.black45,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
