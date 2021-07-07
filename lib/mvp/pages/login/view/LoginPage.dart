import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/mvp/bloc/bloc.dart';
import 'package:flutterapp/mvp/bloc/bloc_provider.dart';
import 'package:flutterapp/mvp/bloc/event.dart';
import 'package:flutterapp/mvp/pages/login/presenter/LoginPresenter.dart';
import 'package:flutterapp/mvp/pages/login/view/LoginPageView.dart';
import 'package:flutterapp/widgets/custom_button.dart';
import 'package:flutterapp/widgets/custom_input.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageView{
  LoginPresenter _loginPresenter;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    _loginPresenter = new LoginPresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Bloc _bloc = BlocProvider.of<Bloc>(context);

    return Scaffold(
      //resizeToAvoidBottomInset : false,
        extendBodyBehindAppBar: true,
        body:
        Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xffdec3fc), Color(0xff90c5fc)])
                ),
                child: Container(
                    margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
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
                              CustomInput(hintText: "Username", icon: Icons.person, controller: this.usernameController,),
                              SizedBox(height: 20,),
                              CustomInput(hintText: "Password",obscureText: true, icon: Icons.lock, controller: this.passwordController)
                            ],
                          ),
                        ),
                        SizedBox(height: 60,),
                        CustomButton(onCustomButtonPressed: (){
                          this.login(_bloc);
                        },),
                        SizedBox(height: 20,),
                        Text(
                          "Forgot your password?",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        StreamBuilder<int>(
                          stream: _bloc.counterStream,
                          initialData: 0,
                          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                            return Text(
                                (snapshot.data.toString())
                            );
                          },
                        )
                      ],
                    )
                ),
              ),
            )
          ],
        )
    );
  }

  void login(Bloc _bloc){
    /*Utils.showLoading(context);
    //_loginPresenter.tryLogin("eve.holt@reqres.in", "fef");
    _loginPresenter.tryLogin(usernameController.text, passwordController.text);*/
    _bloc.counterEventSink.add(IncrementEvent());
  }

  @override
  onSuccessLogin(bool ingreso, [String token]) {
    Navigator.of(context).pop();
    if(ingreso){
      Navigator.popAndPushNamed(context, '/home', arguments: {"user" : token});
    } else {
      Toast.show("Incorrect credentials", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }
}