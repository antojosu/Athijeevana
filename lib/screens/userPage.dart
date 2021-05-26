import 'package:athijeevana/model/requirement.dart';
import 'package:athijeevana/screens/authentication/phonenumber.dart';
import 'package:athijeevana/widgets/userCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String name = "loading";
  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => PhoneNumber()),
        (route) => false);
  }

  Future<List<requirement>> getData() async {
    List<requirement> requirements = [];

    await FirebaseFirestore.instance
        .collection("Food")
        .doc(auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var description = (documentSnapshot.data() as dynamic)['description'];
        var place = (documentSnapshot.data() as dynamic)['place'];
        var category = (documentSnapshot.data() as dynamic)['category'];
        var fullname = (documentSnapshot.data() as dynamic)['fullname'];
        var phoneNumber = (documentSnapshot.data() as dynamic)['phone'];
        requirement req =
            requirement(description, place, phoneNumber, fullname, category);
        requirements.add(req);
      }
    });

    return requirements;
  }

  Future<void> _getName() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          name = (documentSnapshot.data() as dynamic)['fullname'];
        });
      }
    });
  }

  @override
  void initState() {
    _getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Icon(
                            Icons.person,
                            size: 14.h,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 4.h,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(auth.currentUser!.phoneNumber!,
                            style: TextStyle(
                              fontSize: 2.h,
                            )),
                        SizedBox(height: 3.h),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {
                              _signOut(context);
                            },
                            child: Container(
                              child: Text("Logout"),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text("Posted Requirements",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 2.h,
                    )),
                SizedBox(
                  height: 3.h,
                ),
                FutureBuilder(
                    future: getData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          shrinkWrap: true,
                          children:
                              List.generate(snapshot.data.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: userCard(snapshot.data[index]),
                            );
                          }),
                        );
                      } else {
                        return Center(
                            child: Container(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(),
                        ));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
