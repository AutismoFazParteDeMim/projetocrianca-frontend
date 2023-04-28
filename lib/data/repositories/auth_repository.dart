import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/models/user_model.dart';
import 'package:projeto_crianca/data/providers/auth_provider.dart';
import 'package:projeto_crianca/data/providers/user_provider.dart';

class AuthRepository {
  final AuthProvider authProvider;
  final UserProvider userProvider;

  AuthRepository({
    required this.authProvider,
    required this.userProvider,
  });

  Future<void> loginWithEmailAndPass(String email, String password) async {
    await authProvider.loginWithEmailAndPass(email, password);
  }

  Future<void> loginWithGoogle() async {
    await authProvider.loginWithGoogle();
  }

  Future<void> loginWithFacebook() async {
    await authProvider.loginWithFacebook();
  }

  Future<void> logOut() async {
    await authProvider.logOut();
  }

  Future<void> resetPassword({required String email}) async {
    return await authProvider.resetPassword(email: email);
  }

  //user provider
  UserModel? getCurrentUser() {
    return userProvider.getCurrentUser();
  }

  Future<ChildModel?> getCurrentChild() async {
    return await userProvider.getCurrentChild();
  }

  Stream<ChildModel>? getChildStream() {
    return userProvider.getChildStream();
  }
}
