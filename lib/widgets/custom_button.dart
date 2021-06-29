import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onCustomButtonPressed;

  CustomButton({
    @required this.onCustomButtonPressed
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: ElevatedButton(
          onPressed: this.onCustomButtonPressed,
          child: new Text("Login", style: TextStyle(color: Colors.white)),
        style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(borderRadius: BorderRadius.circular(25));
            })
        ),
      ),
      constraints: BoxConstraints.tightFor(width: double.infinity, height: 45),
    );
  }
}