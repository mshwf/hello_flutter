import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/provider/userModel.dart';

class UserRepository with ChangeNotifier {
  UserRepository() {
    user = new UserModel();
  }
  UserModel _user;
  UserModel get user => _user;
  set user(UserModel newValue) {
    if (newValue != _user) {
      _user = newValue;
      notifyListeners();
    }
  }

  void save() {
  }
}
