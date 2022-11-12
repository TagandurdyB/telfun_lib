import '/Models/SharedPref.dart';

SharedPLogin UserLoginDetals = SharedPLogin();
ShPUser UserProperties = ShPUser();

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
