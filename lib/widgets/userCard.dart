import 'package:athijeevana/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> _delReq(String url) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference req = FirebaseFirestore.instance.collection(url);
  req
      .doc(auth.currentUser!.uid)
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}

Widget userCard(dynamic snapshot, BuildContext context) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 16)],
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(snapshot.description,
            style: TextStyle(color: Colors.white, fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () async {
                  _delReq(snapshot.category);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (route) => false);
                },
                child: Container(
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.pink),
                  ),
                ))
          ],
        )
      ],
    ),
  );
}
