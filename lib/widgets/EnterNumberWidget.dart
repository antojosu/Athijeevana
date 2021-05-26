import 'package:athijeevana/screens/authentication/verify.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget enterNum(String number, BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter your number',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 3.w,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 12.0),
              Text(
                '+91 $number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 4.w,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 5.0.w),
      Expanded(
        child: InkWell(
          onTap: () async {
            if (number.length == 10) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerifyPhone(phoneNumber: number)));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: SizedBox(
              width: 3.w,
              height: 5.h,
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 4.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
