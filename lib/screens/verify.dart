import 'package:athijeevana/widgets/NumberCodeBox.dart';
import 'package:athijeevana/widgets/NumberPad.dart';
import 'package:flutter/material.dart';

class VerifyPhone extends StatefulWidget {
  final String phoneNumber;

  VerifyPhone({required this.phoneNumber});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        title: Text(
          "Verify phone number",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurple[800],
        centerTitle: true,
      ),
      body: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return portraitMode(context);
          } else {
            return landscapeMode(context);
          }
        }),
      ),
    );
  }

  Widget portraitMode(BuildContext bc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.5),
                child: Text(
                  "OTP has been sent to " + widget.phoneNumber,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildCodeNumberBox(otp.length > 0 ? otp.substring(0, 1) : ""),
                  buildCodeNumberBox(otp.length > 1 ? otp.substring(1, 2) : ""),
                  buildCodeNumberBox(otp.length > 2 ? otp.substring(2, 3) : ""),
                  buildCodeNumberBox(otp.length > 3 ? otp.substring(3, 4) : ""),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(bc).size.height * 0.05,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: NumberPad(onNumSelect: (value) {
                      setState(() {
                        if (value != -1) {
                          if (otp.length != 10) {
                            otp = otp + value.toString();
                          }
                        } else {
                          if (otp.length != 0) {
                            otp = otp.substring(0, otp.length - 1);
                          }
                        }
                      });
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget landscapeMode(BuildContext bc) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "OTP has been sent to " + widget.phoneNumber,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildCodeNumberBox(otp.length > 0 ? otp.substring(0, 1) : ""),
                  buildCodeNumberBox(otp.length > 1 ? otp.substring(1, 2) : ""),
                  buildCodeNumberBox(otp.length > 2 ? otp.substring(2, 3) : ""),
                  buildCodeNumberBox(otp.length > 3 ? otp.substring(3, 4) : ""),
                ],
              ),
            ],
          ),
          Flexible(child: NumberPad(onNumSelect: (value) {
            setState(() {
              if (value != -1) {
                if (otp.length != 10) {
                  otp = otp + value.toString();
                }
              } else {
                if (otp.length != 0) {
                  otp = otp.substring(0, otp.length - 1);
                }
              }
            });
          }))
        ],
      ),
    );
  }
}
