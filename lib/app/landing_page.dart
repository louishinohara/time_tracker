import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/services/database.dart';
import './sign_in/sign_in_page.dart';
import 'home/home_page.dart';
import 'home/jobs/jobs_page.dart';


class LandingPage extends StatelessWidget {
// Use strema builder to get rid of state management code
  @override // :)
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            // As long as user is not null, it will go to home page
            return Provider<Database>(
              create: (_) => FirestoreDatabase(uid: user.uid),
              child: HomePage(),
            );
            // This will update the user to null by calling the _updateUser function which changes the state. Widget rebuilds but sees that it is null so it will return back to signInPage
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
