import 'package:firebase_auth/firebase_auth.dart';

class firebaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isUserOut() {
    var user = _auth.currentUser;
    print(user);
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}
