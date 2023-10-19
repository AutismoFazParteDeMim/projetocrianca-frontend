import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/entities/user_entity.dart';

abstract class RegisterRepository {
  Future<User?> loginWithGoogle();
  Future<User?> loginWithFacebook();
  Future<User?> registerWithEmailAndPass(String email, String password);
  Future<void> updateUser(User userInstance, UserEntity user);
  Future<void> updateChild(User userInstance, ChildEntity child);
  Future<void> createChild(User userInstance, ChildEntity child);
}
