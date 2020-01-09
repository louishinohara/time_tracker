import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  // Properties in stateless widget must be immutable
  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius: 4.0,
    this.height: 50,
    this.onPressed,
  });
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
          child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        onPressed:
            onPressed, // () => Paramter/Function and {} is code written (to do)
      ),
    );
  }
}
