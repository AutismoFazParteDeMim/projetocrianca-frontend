import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/entities/user_entity.dart';
import 'package:projeto_crianca/core/domain/repositories/register_repository.dart';
import 'package:projeto_crianca/core/infra/datasources/auth_datasource.dart';
import 'package:projeto_crianca/core/infra/datasources/user_datasource.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl(this.authDatasource, this.userDatasource);

  final AuthDatasource authDatasource;
  final UserDatasource userDatasource;

  @override
  Future<User?> loginWithGoogle() async {
    return authDatasource.loginWithGoogle();
  }

  @override
  Future<User?> loginWithFacebook() async {
    return authDatasource.loginWithFacebook();
  }

  @override
  Future<User?> registerWithEmailAndPass(String email, String password) async {
    return authDatasource.registerWithEmailAndPass(email, password);
  }

  @override
  Future<void> updateUser(User userInstance, UserEntity user) async {
    return userDatasource.updateUser(userInstance, user);
  }

  @override
  Future<void> updateChild(User userInstance, ChildEntity child) async {
    return userDatasource.updateChild(userInstance, child);
  }

  @override
  Future<void> createChild(User userInstance, ChildEntity child) async {
    return userDatasource.createChild(userInstance, child);
  }
}
