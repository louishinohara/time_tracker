import 'package:flutter/material.dart';
import 'package:time_tracker/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton{
  SignInButton({          // Constructor for custom sign in button
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(             // Importing properties from custom raised button
    child: Text(text, style: TextStyle(color: textColor, fontSize: 15.0),
    ),
    color: color,
    borderRadius: 8.0,
    height: 40,
    onPressed: onPressed,
  );
}