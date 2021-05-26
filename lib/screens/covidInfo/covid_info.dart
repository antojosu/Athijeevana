import 'package:athijeevana/screens/covidInfo/StateStatCovid.dart';
import 'package:athijeevana/widgets/InfoCard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class covidInfo extends StatefulWidget {
  @override
  _covidInfoState createState() => _covidInfoState();
}

class _covidInfoState extends State<covidInfo> {
  List<String> stats = [];
  Future getSummary() async {
    var response =
        await Dio().get("https://api.rootnet.in/covid19-in/stats/latest");
    Map<String, dynamic> map = response.data['data']['summary'];
    stats = [
      map['total'].toString(),
      map['confirmedCasesIndian'].toString(),
      map['discharged'].toString(),
      map['deaths'].toString()
    ];
    return stats;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSummary(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.analytics,
                        color: Colors.blue[700],
                        size: 30,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "COVID-19 Status in India",
                        style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      infoCard(stats[0], "Total Cases",
                          "assets/images/covid-19.png"),
                      infoCard(
                          stats[1], "New Cases", "assets/images/hazard.png"),
                      infoCard(
                          stats[2], "Recovered", "assets/images/recovered.png"),
                      infoCard(stats[3], "Death", "assets/images/dead.png"),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CovidState())),
                    child: SizedBox(
                      height: 25.w,
                      width: 100.h,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade400,
                              blurRadius: 15.0,
                              offset: Offset(
                                1,
                                1,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade800,
                            Colors.blueAccent.shade700,
                            Colors.lightBlue,
                          ]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Image.asset("assets/images/covid-19.png"),
                              SizedBox(
                                width: 3.h,
                              ),
                              Text(
                                "Check State wise COVID-19 Cases",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
                child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}
