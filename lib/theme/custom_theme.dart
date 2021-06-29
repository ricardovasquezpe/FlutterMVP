import 'package:flutter/material.dart';
import 'package:flutterapp/theme/custom_colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: CustomColors.purple,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito',
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        )
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: CustomColors.darkGrey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Nunito',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        )
    );
  }
}