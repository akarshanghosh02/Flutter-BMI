import 'package:flutter/material.dart';
import 'resultpage.dart';

class calculateButton extends StatelessWidget {
  calculateButton({this.buttonText, this.onPressed});
  final String buttonText;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
      ),
    );
  }
}
