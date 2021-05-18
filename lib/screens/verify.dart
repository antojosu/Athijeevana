import 'package:flutter/material.dart';

class VerifyPhone extends StatefulWidget {

  final String phoneNumber;

  VerifyPhone({@required this.phoneNumber});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {

  String pin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        title: Text(
          "Verify phone number",
          style: TextStyle(
            fontSize: 27.5,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple[800],
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.5),
                        child: Text(
                          "Code has been sent to " + widget.phoneNumber,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.deepPurple[800],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            buildCodeNumberBox(pin.length > 0 ? pin.substring(0, 1) : ""),
                            buildCodeNumberBox(pin.length > 1 ? pin.substring(1, 2) : ""),
                            buildCodeNumberBox(pin.length > 2 ? pin.substring(2, 3) : ""),
                            buildCodeNumberBox(pin.length > 3 ? pin.substring(3, 4) : ""),

                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Text(
                              'Resend Code',
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.5),
                  child: Row(
                    children: <Widget>[

                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFDC3D),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Verify and Create Account',
                                style: TextStyle(
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75)
              )
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}