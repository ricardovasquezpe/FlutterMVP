import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:flutterapp/mvp/pages/home/view/HomePage.dart';
import 'package:flutterapp/mvp/pages/login/view/LoginPage.dart';
import 'package:flutterapp/mvp/utils/Dependencies.dart';

void main() {
  Stetho.initialize();
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}