import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/models/user_model.dart';
import 'package:projeto_crianca/data/providers/auth_provider.dart';
import 'package:projeto_crianca/data/providers/user_provider.dart';

class RegisterRepository {
  RegisterRepository(this.authProvider, this.userProvider);

  final AuthProvider authProvider;
  final UserProvider userProvider;

  Future<User?> loginWithGoogle() async {
    return authProvider.loginWithGoogle();
  }

  Future<User?> loginWithFacebook() async {
    return authProvider.loginWithFacebook();
  }

  Future<User?> registerWithEmailAndPass(String email, String password) async {
    return authProvider.registerWithEmailAndPass(email, password);
  }

  Future<void> updateUser(User userInstance, UserModel user) async {
    return userProvider.updateUser(userInstance, user);
  }

  Future<void> updateChild(User userInstance, ChildModel child) async {
    return userProvider.updateChild(userInstance, child);
  }

  Future<void> createChild(User userInstance, ChildModel child) async {
    return userProvider.createChild(userInstance, child);
  }
}
