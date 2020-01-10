import 'package:flutter/material.dart';
import 'package:time_tracker/app/home_page.dart';
import 'package:time_tracker/services/auth.dart';

import 'dart:async';
import './sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User _user;

  @override // Get current user and update state when application restarts. AKA automatic log in
  void initState(){     // We dont have to await in this case but we are still caliing the future method (LECTURE 142)
    super.initState();
    _checkCurrentUser();
  }
// ^ and V are related
  Future<void> _checkCurrentUser() async {    // This method updates the user if they have been prveiosuly loggen in 
    User user = await widget.auth.currentUser();
    _updateUser(user);
  }


  void _updateUser(User user) {
    // Sets the state so the firebase private user is the logged in user
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    // As long as user is not null, it will go to home page
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: _updateUser,
      );
    }
    return HomePage(
      auth: widget.auth,
      // This will update the user to null by calling the _updateUser function which changes the state. Widget rebuilds but sees that it is null so it will return back to signInPage
      onSignOut: () => _updateUser(null),
    );
  }
}
