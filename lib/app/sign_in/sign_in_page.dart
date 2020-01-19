import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker/app/sign_in/sign_in_bloc.dart';
import 'package:time_tracker/common_widgets/platform_exception_alert_dialog.dart';
import 'package:time_tracker/services/auth.dart';
import 'dart:async';
import './social_sign_in_button.dart';
import 'package:flutter/services.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.bloc, @required this.isLoading})
      : super(key: key);
  final SignInBloc bloc;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context,
        listen: false); // Might need listen.false
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false), //Changed builder to create
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInBloc>(
          create: (_) => SignInBloc(
              auth: auth,
              isLoading:
                  isLoading), ////////////// DONT KNOW IF AUTH: AUTH IS NEEDED

          child: Consumer<SignInBloc>(
            builder: (context, bloc, _) =>
                SignInPage(bloc: bloc, isLoading: isLoading.value),
          ),
        ),
      ),
    );
  }

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: 'Sign in failed',
      exception: exception,
    ).show(context);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    // Sending a request to firebase to authenticate
    try {
      // final auth = Provider.of<AuthBase>(context, listen: false);
      await bloc
          .signInAnonymously(); // Sign in anonymously returns a future which returns a box with a value which won't be available immediately

    } on PlatformException catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    // Sending a request to firebase to authenticate
    try {
      // final auth = Provider.of<AuthBase>(context, listen: false);
      await bloc.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != "ERROR_ABORTED_BY_USER") {
        _showSignInError(context, e);
      }
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    // Sending a request to firebase to authenticate
    try {
      // final auth = Provider.of<AuthBase>(context, listen: false);
      await bloc.signInWithFacebook();
    } on PlatformException catch (e) {
      if (e.code != "ERROR_ABORTED_BY_USER") {
        _showSignInError(context, e);
      }
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

  Widget _buildContent(BuildContext context, ) {
    // Set return type to be a widget
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // A container can specify a widget child
        children: <Widget>[
          // A column has children which is a list of widgets
          SizedBox(
            height: 50,
            child: _buildHeader(),
          ),

          SizedBox(height: 48),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: isLoading ? null : () => _signInWithGoogle(context),
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () =>
                isLoading ? null : () => _signInWithFacebook(context),
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/mail.png',
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: isLoading ? null : () => _signInWithEmail(context),
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
            onPressed: isLoading ? null : () => _signInAnonymously(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
