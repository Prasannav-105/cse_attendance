import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static Future<UserCredential> logIn(
      {required String email, required String password}) async {
    final firebaseinstance = FirebaseAuth.instance;
    return await firebaseinstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
