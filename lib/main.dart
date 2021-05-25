import 'package:athijeevana/screens/home.dart';
import 'package:athijeevana/screens/phonenumber.dart';
import 'package:athijeevana/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AthiJeevanaMain());
}

class AthiJeevanaMain extends StatefulWidget {
  @override
  _AthiJeevanaMainState createState() => _AthiJeevanaMainState();
}

class _AthiJeevanaMainState extends State<AthiJeevanaMain> {
  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      print("Error in main.dart");
      print(e.toString());
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return MaterialApp(home: Text("Error"));
    }
    if (!_initialized) {
      return MaterialApp(home: Text("Loading"));
    }
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: Login());
      },
    );
  }
}
