import 'package:athijeevana/screens/StateStatCovid.dart';
import 'package:athijeevana/widgets/InfoCard.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class covidInfo extends StatefulWidget {
  @override
  _covidInfoState createState() => _covidInfoState();
}

class _covidInfoState extends State<covidInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                infoCard("14M", "Total Cases", "assets/images/covid-19.png"),
                infoCard("10599+", "New Cases", "assets/images/hazard.png"),
                infoCard("22674", "Recovered", "assets/images/recovered.png"),
                infoCard("240", "Death", "assets/images/dead.png"),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            GestureDetector(
              onTap: () => CovidState(),
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
      ),
    );
  }
}
