import 'package:projeto_crianca/data/providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider provider;

  AuthRepository(this.provider);

  Future<void> loginWithEmailAndPass(String email, String password) async {
    await provider.loginWithEmailAndPass(email, password);
  }

  Future<void> loginWithGoogle() async {
    await provider.loginWithGoogle();
  }
}
