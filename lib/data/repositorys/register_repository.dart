import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/models/user_model.dart';
import 'package:projeto_crianca/data/providers/auth_provider.dart';
import 'package:projeto_crianca/data/providers/user_provider.dart';

class RegisterRepository {
  final AuthProvider authProvider;
  final UserProvider userProvider;

  RegisterRepository(this.authProvider, this.userProvider);

  Future<User?> loginWithGoogle() async {
    return await authProvider.loginWithGoogle();
  }

  Future<User?> loginWithFacebook() async {
    return await authProvider.loginWithFacebook();
  }

  Future<User?> registerWithEmailAndPass(String email, String password) async {
    return await authProvider.register(email, password);
  }

  Future<void> updateUser(User userInstance, UserModel user) async {
    await userProvider.updateUser(userInstance, user);
  }

  Future<void> updateChild(User userInstance, ChildModel child) async {
    await userProvider.updateChild(userInstance, child);
  }

  Future<void> createChild(User userInstance, ChildModel child) async {
    await userProvider.createChild(userInstance, child);
  }
}
