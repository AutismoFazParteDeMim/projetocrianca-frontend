import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/entities/user_entity.dart';
import 'package:projeto_crianca/core/domain/repositories/auth_repository.dart';
import 'package:projeto_crianca/core/infra/datasources/auth_datasource.dart';
import 'package:projeto_crianca/core/infra/datasources/user_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.authDatasource,
    required this.userDatasource,
  });

  final AuthDatasource authDatasource;
  final UserDatasource userDatasource;

  @override
  Future<void> loginWithEmailAndPass(String email, String password) async {
    await authDatasource.loginWithEmailAndPass(email, password);
  }

  @override
  Future<void> loginWithGoogle() async {
    await authDatasource.loginWithGoogle();
  }

  @override
  Future<void> loginWithFacebook() async {
    await authDatasource.loginWithFacebook();
  }

  @override
  Future<void> logOut() async {
    await authDatasource.logOut();
  }

  @override
  Future<void> resetPassword({required String email}) async {
    return authDatasource.resetPassword(email: email);
  }

  //user datasource
  @override
  UserEntity? getCurrentUser() {
    return userDatasource.getCurrentUser();
  }

  @override
  Future<ChildEntity?> getCurrentChild() async {
    return userDatasource.getCurrentChild();
  }

  @override
  Stream<ChildEntity>? getChildStream() {
    return userDatasource.getChildStream();
  }
}
