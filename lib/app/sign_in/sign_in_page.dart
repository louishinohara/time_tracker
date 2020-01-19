import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker/services/auth.dart';
import 'dart:async';
import './social_sign_in_button.dart';

class SignInPage extends StatelessWidget {

  Future<void> _signInAnonymously(BuildContext context) async {
    // Sending a request to firebase to authenticate
    try {
       final auth = Provider.of<AuthBase>(context, listen: false);
      await auth
          .signInAnonymously(); // Sign in anonymously returns a future which returns a box with a value which won't be available immediately

    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    // Sending a request to firebase to authenticate
    try {
       final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    // Sending a request to firebase to authenticate
    try {
       final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithFacebook();
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  void _signInWithEmail(BuildContext context) {
    // final auth = Auth.of(context);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  // Creating a new class for the main.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Used to build the page
      appBar: AppBar(
        title: Text('Time Tracker'), // Text displayed on app bar
        elevation: 2,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildContent(BuildContext context) {
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
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () => _signInWithGoogle(context),
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () => _signInWithFacebook(context),
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/mail.png',
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height: 8.0),
          Text('or',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/anonymous.png',
            text: 'Go Anonymously',
            textColor: Colors.white,
            color: Colors.black45,
            onPressed: () => _signInAnonymously(context),
          ),
        ],
      ),
    );
  }
}
