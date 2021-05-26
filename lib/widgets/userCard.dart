import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> _delReq(String url) async {
  print(url);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget userCard(dynamic snapshot) {
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
        Text(snapshot.description,
            style: TextStyle(color: Colors.white, fontSize: 18)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () => _delReq("tel:" + snapshot.description),
                child: Container(
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.pink),
                  ),
                ))
          ],
        )
      ],
    ),
  );
}
