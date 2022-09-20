import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:projeto_crianca/data/models/child_model.dart';

class AuthProvider {
  static final FirebaseAuth _instance = FirebaseAuth.instance;

  Future<void> loginWithEmailAndPass(String email, String password) async {
    await _instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<User?> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _instance.signInWithCredential(credential).then(
          (value) => value.user,
        );
  }

  Future<User?> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );

    return await _instance.signInWithCredential(facebookAuthCredential).then(
          (value) => value.user,
        );
  }

  Future<void> logOut() async {
    await _instance.signOut();
  }

  Future<User?> register(String email, String password) async {
    return await _instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => value.user);
  }
}
