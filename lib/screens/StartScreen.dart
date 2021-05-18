import 'package:athijeevana/screens/phonenumber.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      body: Padding(
        padding: const EdgeInsets.all(16.5),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 35.0),
              Image(
                image: AssetImage('assets/images/phone.png'),
              ),
              Expanded(
                child: TextButton.icon(
                  icon: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Continue with phone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhoneNumber()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
