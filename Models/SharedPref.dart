import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> _UserDetals = [];
bool RemenberMeEnable = false, _IsLogin;

class SharedPBase {
  static SharedPreferences _SPUserDetals;
/*  final List<String>UserDetals;
  SharedPBase(this.UserDetals);*/
  Future<void> createSharedPObj() async {
    _SPUserDetals = await SharedPreferences.getInstance();
    //_SPLang = await SharedPreferences.getInstance();
  }

  void saveShPUser(List<String> value) {
    _SPUserDetals.setStringList("UserValue", value);
  }

  void loadShPUser() {
    _UserDetals = _SPUserDetals.getStringList("UserValue")?? [];
  }

  List<String> getUserDetals() {
    return _UserDetals;
  }
}

class SharedPLogin {
  static SharedPreferences _SPUserDetals;
  Future<void> createSharedPObj() async {
    _SPUserDetals = await SharedPreferences.getInstance();
  }

  void saveLogin(bool Is) {
    _SPUserDetals.setBool("IsLogin", Is);
    loadIsLogin();
  }

  void loadIsLogin() {
    _IsLogin = _SPUserDetals.getBool("IsLogin") ?? false;
  }

  bool getIsLogin() {
    loadIsLogin();
    return _IsLogin;
  }
}