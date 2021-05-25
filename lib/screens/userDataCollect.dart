import 'package:athijeevana/model/user.dart';
import 'package:athijeevana/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserCollect extends StatefulWidget {
  @override
  _UserCollectState createState() => _UserCollectState();
}

class _UserCollectState extends State<UserCollect> {
  late String name, state;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final myController = TextEditingController();

  final myController1 = TextEditingController();
  void submitData() {
    name = myController.text;
    state = myController1.text;
    var uid = auth.currentUser!.uid;
    var phonenumber = auth.currentUser!.phoneNumber;
    DocumentReference<Map<String, dynamic>> users =
        FirebaseFirestore.instance.collection('users').doc(uid);
    var myJSONObj = {"fullname": name, "place": state, "phone": phonenumber};
    users
        .set(myJSONObj)
        .then((value) => print("User with CustomID added"))
        .catchError((error) => print("Failed to add user: $error"));

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Set up account",
            style: TextStyle(color: Colors.blueGrey),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Full Name'),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormField(
                    controller: myController1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Your Place'),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (myController.text.isNotEmpty &&
                            myController1.text.isNotEmpty) {
                          submitData();
                        } else {
                          Fluttertoast.showToast(
                              msg: "Fill all details",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Container(
                        child: Text("Continue"),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
/*
validator: (value) {
                    if (value.isEmpty) {
                      return "Please Fill";
                    }
                    return null;
                  }),*/
