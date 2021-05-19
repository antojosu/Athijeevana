import 'package:athijeevana/screens/verify.dart';
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
                  fontSize: 2.5.h,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 12.0),
              Text(
                '+91 $number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 3.0.h,
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
          onTap: () {
            //if (number.length == 10) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VerifyPhone(phoneNumber: number)));
            //  }
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
              height: 7.h,
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 5.w,
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
