import 'package:athijeevana/screens/home.dart';
import 'package:athijeevana/screens/userDataCollect.dart';
import 'package:athijeevana/widgets/NumberCodeBox.dart';
import 'package:athijeevana/widgets/NumberPad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerifyPhone extends StatefulWidget {
  final String phoneNumber;

  VerifyPhone({required this.phoneNumber});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  late String _verificationID;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String otp = "";
  void otpManage(int value) {
    setState(() {
      switch (value) {
        case -1:
          if (otp.length != 0) {
            otp = otp.substring(0, otp.length - 1);
          }

          break;
        default:
          if (otp.length != 7) {
            otp = otp + value.toString();
          }
      }
    });
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91' + widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          print("VerificationComplete");
          await FirebaseAuth.instance
              .signInWithCredential(authCredential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print("VerificationFailed");
          print(e.message);
        },
        codeAutoRetrievalTimeout: (String verID) {
          print("CodeAUtoR");
          setState(() {
            _verificationID = verID;
          });
        },
        timeout: Duration(seconds: 10),
        codeSent: (String verificationId, int? forceResendingToken) {
          print("CodeSent");
        });
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            return SingleChildScrollView(child: portraitMode(context));
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.5),
                child: Text(
                  "OTP has been sent to " + widget.phoneNumber,
                  style: TextStyle(
                    fontSize: 3.h,
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
                  buildCodeNumberBox(otp.length > 4 ? otp.substring(4, 5) : ""),
                  buildCodeNumberBox(otp.length > 5 ? otp.substring(5, 6) : ""),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(bc).size.height * 0.05,
              ),
              SizedBox(
                height: MediaQuery.of(bc).size.height * 0.05,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  onPressed: () async {
                    if (otp.length >= 6) {
                      otp = otp.substring(0, 6);
                      print(otp);
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(
                          PhoneAuthProvider.credential(
                              verificationId: _verificationID, smsCode: otp),
                        )
                            .then((value) async {
                          if (value.user != null) {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(value.user!.uid.toString())
                                .get()
                                .then((DocumentSnapshot documentSnapshot) {
                              if (documentSnapshot.exists) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                    (route) => false);
                              } else {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserCollect()),
                                    (route) => false);
                              }
                            });
                          } else {
                            print("Error @ 189");
                          }
                        });
                      } catch (e) {
                        print("From Catch");
                        print(e);
                      }
                    } else {
                      print(otp.length);
                      print("Here");
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  )),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: NumberPad(onNumSelect: (value) {
                      otpManage(value);
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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "OTP has been sent to +91 " + widget.phoneNumber,
                style: TextStyle(
                  fontSize: 4.w,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildCodeNumberBox(otp.length > 0 ? otp.substring(0, 1) : ""),
                  buildCodeNumberBox(otp.length > 1 ? otp.substring(1, 2) : ""),
                  buildCodeNumberBox(otp.length > 2 ? otp.substring(2, 3) : ""),
                  buildCodeNumberBox(otp.length > 3 ? otp.substring(3, 4) : ""),
                  buildCodeNumberBox(otp.length > 4 ? otp.substring(4, 5) : ""),
                  buildCodeNumberBox(otp.length > 5 ? otp.substring(5, 6) : ""),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              onPressed: () async {
                if (otp.length >= 6) {
                  otp = otp.substring(0, 6);
                  print(otp);
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(
                      PhoneAuthProvider.credential(
                          verificationId: _verificationID, smsCode: otp),
                    )
                        .then((value) async {
                      if (value.user != null) {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(value.user!.uid.toString())
                            .get()
                            .then((DocumentSnapshot documentSnapshot) {
                          if (documentSnapshot.exists) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                                (route) => false);
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserCollect()),
                                (route) => false);
                          }
                        });
                      } else {
                        print("Error @ 189");
                      }
                    });
                  } catch (e) {
                    print("From Catch");
                    print(e);
                  }
                } else {
                  print(otp.length);
                  print("Here");
                }
              },
              child: Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              )),
          Flexible(child: NumberPad(onNumSelect: (value) {
            otpManage(value);
          }))
        ],
      ),
    );
  }
}
