import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class requirementCovid extends StatefulWidget {
  @override
  _requirementCovidState createState() => _requirementCovidState();
}

class _requirementCovidState extends State<requirementCovid> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
