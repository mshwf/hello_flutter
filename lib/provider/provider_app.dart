import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/provider/userModel.dart';
import 'package:hello_flutter/provider/user_repository.dart';
import 'package:provider/provider.dart';

class StateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
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
    var user = Provider.of<UserRepository>(context);
    TextEditingController addressController =
        TextEditingController(text: user.user.address);

    TextEditingController mobileController =
        TextEditingController(text: user.user.mobile);

    TextEditingController usernameController =
        TextEditingController(text: user.user.username);

    TextEditingController emailController =
        TextEditingController(text: user.user.email);

    TextEditingController countryController =
        TextEditingController(text: user.user.country);

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
                onChanged: (val) => user.user.username = val),
            TextField(
              controller: emailController,
              onChanged: (val) => user.user.email = val,
            ),
            TextField(
                controller: countryController,
                onChanged: (val) => user.user.country = val),
            TextField(
                controller: mobileController,
                onChanged: (val) => user.user.mobile = val),
            TextField(
                controller: addressController,
                onChanged: (val) => user.user.address = val),
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
