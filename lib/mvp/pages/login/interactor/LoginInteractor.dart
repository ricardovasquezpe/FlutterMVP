import 'package:dio/dio.dart';
import 'package:flutterapp/mvp/models/User.dart';
import 'package:flutterapp/mvp/pages/login/presenter/iLoginPresenter.dart';
import 'package:flutterapp/mvp/utils/Constants.dart';
import 'package:flutterapp/mvp/utils/DatabaseHelper.dart';
import 'package:flutterapp/mvp/utils/Dependencies.dart';
import 'package:flutterapp/mvp/utils/Network.dart';
import 'package:sqflite/sqflite.dart';

class LoginInteractor{
  iLoginPresenter _iLoginPresenter;
  final network = getIt.get<Network>();
  final db = getIt.get<DatabaseHelper>();

  LoginInteractor(iLoginPresenter presenter){
    _iLoginPresenter = presenter;
  }

  bool loginInteractor(String username, String password){
    network.dio.post(
        "/login",
        data: {"email": username, "password": password},
        options: Options(headers: Network.HEADERS)).
    then((response) {
      if(response.statusCode == Network.RESPONSE_STATUS_SUCCCESS){
        User user = new User(username, password, USER_ACTIVED, DateTime.now().toUtc().millisecondsSinceEpoch.toString());
        addUser(user).then((value) {
          _iLoginPresenter.onSuccessLogin(true, response.data["token"]);
        }).catchError(print);
      }else{
        _iLoginPresenter.onSuccessLogin(false);
      }
    }).catchError(print);
  }

  Future<int> addUser(User user) async {
    var client = await db.initDb();
    return client.insert('users', user.toMapForDb(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
}