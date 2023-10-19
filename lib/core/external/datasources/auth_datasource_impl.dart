import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto_crianca/core/infra/datasources/auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final FirebaseAuth _instance = FirebaseAuth.instance;

  @override
  Future<void> loginWithEmailAndPass(String email, String password) async {
    await _instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<User?> loginWithGoogle() async {
    final googleUser =
        await GoogleSignIn(scopes: ['profile', 'email']).signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return _instance.signInWithCredential(credential).then(
          (value) => value.user,
        );
  }

  @override
  Future<User?> loginWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();

    final facebookAuthCredential = FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );

    return _instance.signInWithCredential(facebookAuthCredential).then(
          (value) => value.user,
        );
  }

  @override
  Future<User?> registerWithEmailAndPass(String email, String password) async {
    return _instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => value.user);
  }

  @override
  Future<void> resetPassword({required String email}) async {
    return _instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logOut() async {
    await _instance.signOut();
  }
}
