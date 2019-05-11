import 'package:flutter/material.dart';

class UserModel {
  UserModel() {
    username = "Mohamed";
    email = "me@domain.com";
    country = "Egypt";
    mobile = "10000000001";
    address = "Giza";
  }

  double userCode = 1.0;
  String username;
  String email;
  String country;
  String mobile;
  String address;

  @override
  String toString() {
    return 'username= $username, email= $email, country= $country, mobile= $mobile, address= $address';
  }
}
