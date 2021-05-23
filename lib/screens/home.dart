import 'package:athijeevana/screens/covid_info.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Athijeevana",
          style: TextStyle(color: Colors.blueGrey[900]),
        ),
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
        children: [Icon(Icons.ac_unit_rounded), covidInfo()],
      ),
    );
  }
}
