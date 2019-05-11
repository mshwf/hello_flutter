import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/provider/userModel.dart';

class UserRepository with ChangeNotifier {
  UserRepository(){
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

   @override
  String toString() {
    return 'From User: username= ${user.username}, email= ${user.email}, country= ${user.country}, mobile= ${user.mobile}, address= ${user.address}';
  }
}
