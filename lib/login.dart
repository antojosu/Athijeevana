import 'package:athijeevana/screens/home.dart';
import 'package:athijeevana/screens/authentication/phonenumber.dart';
import 'package:athijeevana/services/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  firebaseAuth auth = new firebaseAuth();

  @override
  Widget build(BuildContext context) {
    return auth.isUserOut() ? Home() : PhoneNumber();
  }
}
