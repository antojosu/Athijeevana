import 'package:athijeevana/model/helpline.dart';
import 'package:athijeevana/widgets/covidCard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:athijeevana/model/covid.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpLine extends StatefulWidget {
  @override
  _HelpLineState createState() => _HelpLineState();
}

class _HelpLineState extends State<HelpLine> {
  Future<void> _makePhoneCall(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<helpline> helplines = [];
  Future<List<helpline>> getHelplines() async {
    helplines = [];
    var response =
        await Dio().get("https://api.rootnet.in/covid19-in/contacts");
    var map = response.data['data']['contacts']['regional'];

    for (var u in map) {
      helpline help = new helpline(u["loc"], u["number"].toString());
      helplines.add(help);
    }
    return helplines;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
              future: getHelplines(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: List.generate(snapshot.data.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.red, Colors.grey]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data[index].loc,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(snapshot.data[index].number,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      onPressed: () => _makePhoneCall(
                                          "tel:" + snapshot.data[index].number),
                                      child: Text(
                                        "Call",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
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
              }),
        ),
      ),
    );
  }
}
