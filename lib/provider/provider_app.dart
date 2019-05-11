import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/provider/userModel.dart';
import 'package:provider/provider.dart';

class StateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          builder: (context) => UserModel(), child: MyStateWidget()),
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
    TextEditingController addressController =
        TextEditingController(text: user.address);

    TextEditingController mobileController =
        TextEditingController(text: user.mobile);

    TextEditingController usernameController =
        TextEditingController(text: user.username);

    TextEditingController emailController =
        TextEditingController(text: user.email);

    TextEditingController countryController =
        TextEditingController(text: user.country);

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
            TextField(
                controller: countryController,
                onChanged: (val) => user.country = val),
            TextField(
                controller: mobileController,
                onChanged: (val) => user.mobile = val),
            TextField(
                controller: addressController,
                onChanged: (val) => user.address = val),
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
