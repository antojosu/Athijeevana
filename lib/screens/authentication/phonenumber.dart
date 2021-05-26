import 'dart:ui';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:athijeevana/widgets/EnterNumberWidget.dart';
import 'package:athijeevana/widgets/NumberPad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  String number = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0x333333),
        elevation: 0,
        title: Text(
          'Continue with phone',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return SingleChildScrollView(child: portraitMode(context));
          } else {
            return SingleChildScrollView(child: landscapeMode(context));
          }
        },
      ),
    );
  }

  Widget portraitMode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.5),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/phone.png',
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          SizedBox(
            height: 1.h,
          ),
          Center(
            child: Text(
              'An OTP will be sent to verify the Mobile Number',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.h,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          enterNum(number, context),
          SizedBox(
            height: 1.h,
          ),
          NumberPad(onNumSelect: (value) {
            setState(() {
              if (value != -1) {
                if (number.length != 10) {
                  number = number + value.toString();
                }
              } else {
                if (number.length != 0) {
                  number = number.substring(0, number.length - 1);
                }
              }
            });
          })
        ],
      ),
    );
  }

  Widget landscapeMode(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: enterNum(number, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Column(
                  children: [
                    SizedBox(height: 17.5),
                    Image.asset(
                      'assets/images/phone.png',
                      width: MediaQuery.of(context).size.width * 0.40,
                    ),
                    SizedBox(height: 2.w),
                    Center(
                      child: Text(
                        'You will recieve a 6 digit code to verify next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 3.w,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: NumberPad(onNumSelect: (value) {
                  setState(() {
                    if (value != -1) {
                      if (number.length != 10) {
                        number = number + value.toString();
                      }
                    } else {
                      if (number.length != 0) {
                        number = number.substring(0, number.length - 1);
                      }
                    }
                  });
                }),
              )
            ],
          )
        ],
      ),
    );
  }
}
