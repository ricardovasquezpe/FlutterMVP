import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/custom_input.dart';
import 'package:flutterapp/widgets/custom_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion',
      theme: ThemeData(
        fontFamily: 'Nunito',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          resizeToAvoidBottomInset : false,
          extendBodyBehindAppBar: true,
          body:
          Column(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xffdec3fc), Color(0xff90c5fc)])
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                            SizedBox(height: 45,),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  CustomInput(hintText: "Username", icon: Icons.person,),
                                  SizedBox(height: 20,),
                                  CustomInput(hintText: "Password",obscureText: true, icon: Icons.lock)
                                ],
                              ),
                            ),
                            SizedBox(height: 60,),
                            CustomButton(onCustomButtonPressed: this.test,),
                            SizedBox(height: 20,),
                            Text(
                                "Forgot your password?",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        )
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text("uno"),
                      ),
                      Row(
                        children: <Widget>[
                          Text("dos"),
                          Text("tres")
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("cuadro"),
                          Text("cinco")
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }

  void test(){
    print("test");
  }

}