import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> loginWithEmailAndPass(String email, String password);
  Future<void> loginWithGoogle();
  Future<void> loginWithFacebook();
  Future<void> logOut();
  Future<void> resetPassword({required String email});
  UserEntity? getCurrentUser();
  Future<ChildEntity?> getCurrentChild();
  Stream<ChildEntity>? getChildStream();
}
