import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onCustomButtonPressed;

  CustomButton({
    @required this.onCustomButtonPressed
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child: RaisedButton(
          elevation: 8,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
          ),
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Color(0xff6A74CE),
          onPressed: this.onCustomButtonPressed,
          child: new Text("Login", style: TextStyle(color: Colors.white)),
      ),
      height: 45.0,
      minWidth: double.infinity
    );
  }
}