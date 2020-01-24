import 'package:flutter/material.dart';
import 'email_sign_in_form_bloc_based.dart';
import 'email_sign_in_form_stateful.dart';
import 'email_sign_in_form_change_notifier.dart';

class EmailSignInPage extends StatelessWidget {
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
            child: EmailSignInFormChangeNotifier.create(context),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

}
