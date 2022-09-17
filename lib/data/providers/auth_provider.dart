import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  static final FirebaseAuth _instance = FirebaseAuth.instance;

  FirebaseAuth get getInstance => _instance;

  Future<void> loginWithEmailAndPass(String email, String password) async {
    try {
      await _instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _instance.signInWithCredential(credential);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await _instance.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
