import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/common_widgets/avatar.dart';
import 'package:time_tracker/common_widgets/platform_alert_dialog.dart';
import 'package:time_tracker/services/auth.dart';

class AccountPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    // Sending a request to firebase to authenticate
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth
          .signOut(); // Sign in anonymously returns a future which returns a box with a value which won't be available immediately
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: Text('Account'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => _confirmSignOut(context),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(130),
            child: _buildUserInfo(user),
          )),
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
      children: <Widget>[
        Avatar(
          photoUrl: user.photoUrl,
          radius: 50,
        ),
        SizedBox(height: 8),
        if (user.displayName != null)
          Text(
            user.displayName,
            style: TextStyle(color: Colors.white),
          ),
        SizedBox(height: 8),
      ],
    );
  }
}
