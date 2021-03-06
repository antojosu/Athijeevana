import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> _makePhoneCall(String url) async {
  print(url);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget requirementCard(String place, String description, String fullname,
    String category, String phoneNumber) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 16)],
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(description, style: TextStyle(color: Colors.white, fontSize: 4.w)),
        SizedBox(height: 2.w),
        Text(place, style: TextStyle(color: Colors.white, fontSize: 18)),
        Text("Posted by " + fullname,
            style: TextStyle(color: Colors.white, fontSize: 15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () => _makePhoneCall("tel:" + phoneNumber),
                child: Container(
                  child: Text(
                    "Call Now",
                    style: TextStyle(color: Colors.pink),
                  ),
                ))
          ],
        )
      ],
    ),
  );
}
