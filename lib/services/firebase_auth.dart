import 'package:athijeevana/screens/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class firebaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void phoneAuth(String number, BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91' + number,
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {},
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {},
    );
  }
}
