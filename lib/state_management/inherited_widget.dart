import 'package:flutter/material.dart';
import 'package:hello_flutter/models/login.dart';
import 'package:hello_flutter/state_management/binding.dart';
import 'package:hello_flutter/state_management/main.dart';

class InheritedWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InheritedWidgetApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(resizeToAvoidBottomPadding: false, body: LoginPage(child: null,)),
    );
  }
}

class LoginPage extends StatefulWidget {
  final LoginModel model;
  final Widget child;

  LoginPage({
    @required this.child,
    this.model,
  });
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

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checked = false;
  LoginModel model;

  @override
  Widget build(BuildContext context) {
    return LoginInheritedWidget(
      child: Container(
        color: Color(0xFF141721),
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextField(
              cursorColor: Colors.pink,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'your@email.com',
                  hintStyle: TextStyle(color: Colors.grey)),
              style: TextStyle(color: Colors.pink),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              autocorrect: false,
              cursorColor: Colors.pink,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey)),
              style: TextStyle(color: Colors.pink),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Color(0xFFE51E49),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            CheckboxListTile(
              title: Text(
                "Remember Me",
                style: TextStyle(color: Colors.pink, fontSize: 12),
              ),
              value: checked,
              onChanged: (newValue) {
                setState(() {
                  checked = !checked;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.pink,
              textColor: Colors.white,
              child: Container(
                child: Text('Sign in'),
                padding: EdgeInsets.symmetric(horizontal: 100),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
            Text(LoginInheritedWidget.of(context).email)
          ],
        ),
      ),
    );
  }
}

class InheritedData extends InheritedWidget {
  InheritedData({Widget child}) : super(child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
