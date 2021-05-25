import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget covidCard(dynamic snapshot) {
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        Text(
          snapshot.loc,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            dataItem(
                snapshot.nw_cases, "New Cases", "assets/images/hazard.png"),
            dataItem(
                snapshot.recovered, "Recovered", "assets/images/recovered.png"),
            dataItem(snapshot.deaths, "Death", "assets/images/dead.png"),
          ],
        ),
      ],
    ),
  );
}

Widget dataItem(String value, String type, String img) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.asset(
        img,
        height: 5.h,
      ),
      Text(
        value,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      Text(type)
    ],
  );
}
