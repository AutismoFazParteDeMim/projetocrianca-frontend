import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<void> loginWithEmailAndPass(String email, String password);
  Future<User?> loginWithGoogle();
  Future<User?> loginWithFacebook();
  Future<User?> registerWithEmailAndPass(String email, String password);
  Future<void> resetPassword({required String email});
  Future<void> logOut();
}
