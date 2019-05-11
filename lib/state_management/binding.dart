import 'package:flutter/material.dart';
import 'package:hello_flutter/models/login.dart';

class LoginInheritedWidget extends InheritedWidget {
  final LoginModel data;
  LoginInheritedWidget({Key key, this.data, Widget child}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginModel of(BuildContext context) {
    if ((context.inheritFromWidgetOfExactType(LoginInheritedWidget)
            as LoginInheritedWidget) ==
        null)
      return LoginModel(email: "defaultEmail", password: "default password");
    else
      return (context.inheritFromWidgetOfExactType(LoginInheritedWidget)
              as LoginInheritedWidget)
          .data;
  }
}