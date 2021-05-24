import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget catCard(String text, Color color) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: color, blurRadius: 5, offset: Offset(1, 1))
      ], color: color, borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: EdgeInsets.all(5),
      width: 15.h,
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 2.h,
            fontWeight: FontWeight.w400),
      )),
    ),
  );
}
