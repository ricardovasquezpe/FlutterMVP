import 'package:flutter/cupertino.dart';

class User{
  @required
  final String email;
  @required
  final String password;
  @required
  final int active;
  @required
  final String lastLogin;

  User(this.email, this.password, this.active, this.lastLogin);

  Map<String, dynamic> toMapForDb() {
    var map = Map<String, dynamic>();
    map['email'] = email;
    map['password'] = password;
    map['active'] = active;
    map['lastLogin'] = lastLogin;
    return map;
  }
}