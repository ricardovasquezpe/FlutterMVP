import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  int maxLength;
  bool obscureText;
  bool autocorrect;
  TextInputType keyboardType;
  TextAlign textAlign;
  String hintText;
  bool enabled;
  IconData icon;
  final controller;

  CustomInput({
        @required this.hintText,
        this.maxLength = 100,
        this.obscureText = false,
        this.autocorrect = false,
        this.keyboardType = TextInputType.text,
        this.textAlign = TextAlign.start,
        this.enabled = true,
        this.icon = null,
        this.controller = null
      });

  @override
  Widget build(BuildContext context) {
    return
      Material(
        elevation: 5.0,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(25.0),
        child: TextField(
          controller: this.controller,
          enabled: enabled,
          textAlign: this.textAlign,
          obscureText: this.obscureText,
          maxLength: this.maxLength,
          autocorrect: this.autocorrect,
          keyboardType: this.keyboardType,
          decoration: InputDecoration(
            prefixIcon: Icon(this.icon, color: Color(0xffcccccc),),
            hintText: this.hintText,
            filled: true,
            fillColor: Colors.white,
            counterText: '',
            counterStyle: TextStyle(fontSize: 0),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 0,color: Colors.white),
                borderRadius: BorderRadius.circular(25.0)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(width: 0,color: Colors.white),
            ),
            /*disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(25.0)
          ),*/
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0,color: Colors.white),
              borderRadius: BorderRadius.circular(25.0),
            ),
            /*errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(25.0),
          )*/
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.0,
            height: 0.8,
          ),
        ),
      );
  }
}