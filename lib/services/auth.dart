import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User {
  User({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    //Convert a firebase user object to a user object uid
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }


// Not really sure what is going on here
  @override
  Stream<User> get onAuthStateChanged {                             // Stream for auth class. Declaring new getter variable for class
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase); // Convert from type firebaseUser to user
  }

  @override
  Future<User> currentUser() async {
    // Method to get the current user in case they are reloading the app
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }
  @override
  Future<User> signInAnonymously() async {
    // Method to sign in anonymously via firebase
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }
  @override
  Future<void> signOut() async {
    // Method to sign the user out via setting user to null
    await _firebaseAuth.signOut();
  }
}
