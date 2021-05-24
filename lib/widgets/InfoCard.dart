import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget infoCard(String value, String type, String img) {
  return SizedBox(
    height: 12.h,
    width: 12.h,
    child: Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0,
            spreadRadius: 3.0,
            offset: Offset(
              1,
              1,
            ),
          )
        ],
      ),
      child: Column(
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
      ),
    ),
  );
}
