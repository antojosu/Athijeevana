import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _makePhoneCall(String url) async {
  print(url);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget requirementCard(
    String description, String fullname, String category, String phoneNumber) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.pink, Colors.purple]),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 16)],
        borderRadius: BorderRadius.all(Radius.circular(15))),
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Text(description,
                style: TextStyle(color: Colors.white, fontSize: 18))),
        Expanded(
            child: Text("Posted by " + fullname,
                style: TextStyle(color: Colors.white, fontSize: 15))),
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
                    style: TextStyle(color: Colors.black),
                  ),
                ))
          ],
        )
      ],
    ),
  );
}
