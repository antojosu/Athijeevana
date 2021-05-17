import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0x333333),
        title: Text(
          'Continue with phone',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.5),
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/phone.png'),
            SizedBox(height: 17.5),
            Text(
              'You will recieve a 4 digit code to verify next',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 22.5),
            Row(
              children: [
                Text(
                  'Enter your number',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
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
                        SizedBox(width: 8.0),
                        Text(
                          '1000000000',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27.5,
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
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
