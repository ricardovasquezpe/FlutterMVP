import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:flutterapp/mvp/bloc/bloc_provider.dart';
import 'package:flutterapp/mvp/bloc/bloc.dart';
import 'package:flutterapp/mvp/pages/home/view/HomePage.dart';
import 'package:flutterapp/mvp/pages/login/view/LoginPage.dart';
import 'package:flutterapp/mvp/utils/Dependencies.dart';
import 'package:flutterapp/theme/custom_theme.dart';

void main() {
  Stetho.initialize();
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: CustomTheme.darkTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage(),
          },
        )
        , bloc: Bloc()
    );
  }
}