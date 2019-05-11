import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  UserModel() {
    username = "Mohamed";
    email = "m_shawaf@outlook.com";
    country = "Egypt";
    mobile = "01005508565";
    address = "Giza";
  }

  double _userCode = 1;
  String _username;
  String _email;
  String _country;
  String _mobile;
  String _address;

  String get username => _username;
  String get email => _email;
  String get country => _country;
  String get mobile => _mobile;
  String get address => _address;
  double get userCode => _userCode;

  set username(String newValue) {
    _username = newValue;
    if (_username != newValue) notifyListeners();
  }

  set email(String newValue) {
    _email = newValue;
    if (_email != newValue) notifyListeners();
  }

  set country(String newValue) {
    _country = newValue;
    if (_country != newValue) notifyListeners();
  }

  set mobile(String newValue) {
    _mobile = newValue;
    if (_mobile != newValue) notifyListeners();
  }

  set address(String newValue) {
    _address = newValue;
    if (_address != newValue) notifyListeners();
  }

  set userCode(double newValue) {
    _userCode = newValue;
    if (_userCode != newValue) notifyListeners();
  }

  @override
  String toString() {
    return 'username= $username, email= $email, country= $country, mobile= $mobile, address= $address';
  }
}
