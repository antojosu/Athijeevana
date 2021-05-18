import 'dart:ui';

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
            return portraitMode();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget portraitMode() {
    return Padding(
      padding: const EdgeInsets.all(16.5),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/phone.png'),
          SizedBox(height: 17.5),
          Center(
            child: Text(
              'You will recieve a 4 digit code to verify next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 22.5),
          Row(
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
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Text(
                        '+91 $number',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 35.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
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
}
