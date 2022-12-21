import 'package:shared_preferences/shared_preferences.dart';

import '/Models/SharedPref.dart';

SharedPLogin UserLoginDetals = SharedPLogin();
ShPUser
UserProperties = ShPUser();

class ShPUser {
  final int id, isban;
  final String name, phone,token;
  ShPUser({
    this.isban,
    this.name,
    this.phone,
    this.id,
    this.token
  });

  void create() {
    SharedPBase().createSharedPObj();
  }

  void sava() {
    SharedPBase().saveShPUser([id.toString(), name, phone, isban.toString(),token]);
    loading();
  }

  void loading() {
    SharedPBase().loadShPUser();
  }

  void erase() {
    SharedPBase().saveShPUser(["", "", "", "",""]);
    UserLoginDetals.saveLogin(false);
    loading();
  }

  String getProperty(String value) {
    switch (value) {
      case "id":
        return SharedPBase().getUserDetals()[0];
        break;
      case "name":
        return SharedPBase().getUserDetals()[1];
        break;
      case "phone":
        return SharedPBase().getUserDetals()[2];
        break;
      case "isban":
        return SharedPBase().getUserDetals()[3];
        break;
      case "token":
        return SharedPBase().getUserDetals()[4];
        break;
    }
  }

  Map<String, String> getAllProperty() {
    return {
      "id": SharedPBase().getUserDetals()[0],
      "name": SharedPBase().getUserDetals()[1],
      "phone": SharedPBase().getUserDetals()[2],
      "isban": SharedPBase().getUserDetals()[3],
      "token": SharedPBase().getUserDetals()[4],
    };
  }
}

enum dataType{
  int,
  String,
  bool,
}
var _programVal;
SharedPreferences _SPUserDetals;
class ShPValues {
  final String tag;
  final dataType type;
  ShPValues({this.type, this.tag});
  Future<void> create() async {
    _SPUserDetals = await SharedPreferences.getInstance();
  }

  void loading() {
    if(type==dataType.bool)
    _programVal = _SPUserDetals.getBool(tag) ?? true;
    else if(type==dataType.String)
      _programVal = _SPUserDetals.getString(tag) ?? "";
    else if(type==dataType.int)
      _programVal = _SPUserDetals.getInt(tag) ?? 0;

  }

  save(_val) {
    final _ty=_val.runtimeType;
    if(_ty==bool)
    _SPUserDetals.setBool(tag, _val);
    else if(_ty==String)
      _SPUserDetals.setString(tag, _val);
    else if(_ty==int)
      _SPUserDetals.setInt(tag, _val);
    loading();
  }

  get() {
    loading();
    return _programVal;
  }
}
