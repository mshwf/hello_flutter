class UserModel {
  UserModel() {
    username = "Mohamed";
    email = "me@domain.com";
    comms = [Comm.email];
    isMale = true;
  }

  String username;
  String email;
  List<Comm> comms;
  bool isMale;
}

enum Comm { email, phone, sms }
