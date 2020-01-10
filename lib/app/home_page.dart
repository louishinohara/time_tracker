import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({@required this.auth, @required this.onSignOut});
  final VoidCallback onSignOut;
  final AuthBase auth;

  Future<void> _signOut() async {
    // Sending a request to firebase to authenticate
    try {
      await auth.signOut(); // Sign in anonymously returns a future which returns a box with a value which won't be available immediately
      onSignOut();
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Home Page'),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Logout',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          onPressed: _signOut,
        ),
      ],
    ));
  }
}
