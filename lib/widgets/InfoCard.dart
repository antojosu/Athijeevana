import 'package:flutter/material.dart';

Widget infoCard(String value, String type, Icon icon) {
  return SizedBox(
    height: 110,
    width: 110,
    child: Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
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
          icon,
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
