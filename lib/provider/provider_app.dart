import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/provider/userModel.dart';
import 'package:hello_flutter/provider/user_repository.dart';
import 'package:provider/provider.dart';

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          builder: (context) => UserRepository(), child: UserInfoWidget()),
    );
  }
}

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({
    Key key,
  }) : super(key: key);

  @override
  _UserInfoWidgetState createState() => _UserInfoWidgetState();
}

UserRepository userRepo;

class _UserInfoWidgetState extends State<UserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    userRepo = Provider.of<UserRepository>(context);

    TextEditingController usernameController =
        TextEditingController(text: userRepo.user.username);

    TextEditingController emailController =
        TextEditingController(text: userRepo.user.email);

    return Scaffold(
      appBar: AppBar(
        title: Text('User info.'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Basic Info.',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(8),
                ),
                TextField(
                    controller: usernameController,
                    onChanged: (val) => userRepo.user.username = val),
                TextField(
                  controller: emailController,
                  onChanged: (val) => userRepo.user.email = val,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Pref. Communication types',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(8),
                ),
                Column(
                  children: [
                    CheckboxListTile(
                      title: Text('Email'),
                      value: userRepo.user.comms.contains(Comm.email),
                      onChanged: (checked) {
                        setState(() {
                          if (checked)
                            userRepo.user.comms.add(Comm.email);
                          else
                            userRepo.user.comms.remove(Comm.email);
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Phone'),
                      value: userRepo.user.comms.contains(Comm.phone),
                      onChanged: (checked) {
                        setState(() {
                          if (checked)
                            userRepo.user.comms.add(Comm.phone);
                          else
                            userRepo.user.comms.remove(Comm.phone);
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text('SMS'),
                      value: userRepo.user.comms.contains(Comm.sms),
                      onChanged: (checked) {
                        setState(() {
                          if (checked)
                            userRepo.user.comms.add(Comm.sms);
                          else
                            userRepo.user.comms.remove(Comm.sms);
                        });
                      },
                    )
                  ],
                ),
                Container(
                  child: Text(
                    'Sex',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(8),
                ),
                RadioListTile(
                  title: Text('Male'),
                  value: true,
                  groupValue: userRepo.user.isMale,
                  onChanged: (value) {
                    setSex(userRepo.user, value);
                  },
                ),
                RadioListTile(
                  title: Text('Female'),
                  value: false,
                  groupValue: userRepo.user.isMale,
                  onChanged: (value) {
                    setSex(userRepo.user, value);
                  },
                ),
                RaisedButton(child: Text('Save'), onPressed: _saveUser)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setSex(UserModel user, value) {
    setState(() {
      user.isMale = value;
    });
  }

  _saveUser() {
    userRepo.save();
  }
}
