import 'package:athijeevana/widgets/catCard.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class requirementCovid extends StatefulWidget {
  @override
  _requirementCovidState createState() => _requirementCovidState();
}

class _requirementCovidState extends State<requirementCovid> {
  List categories = ["Oxygen", "Food", "Medicines", "Plasma", "Ambulance"];
  List<Color> colors = [
    Colors.blue.shade100,
    Colors.purple.shade100,
    Colors.green.shade100,
    Colors.amber.shade100,
    Colors.pink.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 100.h,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.shade400,
                      blurRadius: 10.0,
                      offset: Offset(
                        1,
                        1,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(colors: [
                    Colors.lightGreen,
                    Colors.green.shade800,
                  ]),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/Thank.png",
                    ),
                    Expanded(
                      child: Text(
                        "Thank you guys for being so brave and helping so many people during this unprecedented time.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            Text(
              "Most Demanded Requirement",
              style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 15.h,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return catCard(categories[index], colors[index]);
                  }),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Latest Requirement Request",
              style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
