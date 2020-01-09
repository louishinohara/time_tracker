import 'package:flutter/material.dart';
import 'package:time_tracker/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    // Constructor for custom sign in button
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text !=
            null), // assert checks for errors. stops execution if boolean expression is false
        assert(assetName != null),
        super(
          // Importing properties from custom raised button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName),
              Text(text, style: TextStyle(color: textColor, fontSize: 15.0)),
              Opacity(
                opacity: 0.0,
                child: Image.asset(assetName),
              ),
            ],
          ),
          color: color,
          borderRadius: 8.0,
          height: 40,
          onPressed: onPressed,
        );
}
