import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/provider/userModel.dart';
import 'package:hello_flutter/provider/user_repository.dart';
import 'package:provider/provider.dart';

class App_State extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<UserRepository>(
          builder: (context) => UserRepository(), child: MyStateWidget()),
    );
  }
}

class MyStateWidget extends StatelessWidget {
  const MyStateWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);

    TextEditingController usernameController =
        TextEditingController(text: user.username);

    TextEditingController emailController =
        TextEditingController(text: user.email);

    return Scaffold(
      appBar: AppBar(
        title: Text('User info.'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: usernameController,
                onChanged: (val) => user.username = val),
            TextField(
              controller: emailController,
              onChanged: (val) => user.email = val,
            ),
            RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  print(user);
                })
          ],
        ),
      ),
    );
  }
}
