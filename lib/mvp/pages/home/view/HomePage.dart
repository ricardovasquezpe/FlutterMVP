import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

    print(args);
    return Text("text");
  }
}