import 'package:athijeevana/screens/covid_info.dart';
import 'package:athijeevana/screens/phonenumber.dart';
import 'package:athijeevana/screens/requirement_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => PhoneNumber()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Athijeevana",
            style: TextStyle(color: Colors.blueGrey[900]),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () => _signOut(context),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.orangeAccent,
            tabs: [
              Tab(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.help_center,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Requirement Center",
                      style: TextStyle(color: Colors.blueGrey[900]))
                ]),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Covid Info ",
                        style: TextStyle(color: Colors.blueGrey[900])),
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [requirementCovid(), covidInfo()],
        ),
      ),
    );
  }
}
