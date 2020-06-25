import 'package:flutterapp/mvp/pages/login/interactor/LoginInteractor.dart';
import 'package:flutterapp/mvp/pages/login/presenter/iLoginPresenter.dart';
import 'package:flutterapp/mvp/pages/login/view/LoginPageView.dart';

class LoginPresenter implements iLoginPresenter{

  LoginPageView _loginPageView;
  LoginInteractor _loginInteractor;

  LoginPresenter(LoginPageView view){
    _loginInteractor = new LoginInteractor(this);
    _loginPageView = view;
  }

  void tryLogin(String name, String password){
    _loginInteractor.loginInteractor(name, password);
  }

  @override
  onSuccessLogin(bool ingreso, [String token]) {
    _loginPageView.onSuccessLogin(ingreso, token);
  }
}