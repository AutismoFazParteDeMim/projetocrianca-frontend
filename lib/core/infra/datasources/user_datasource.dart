import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/entities/user_entity.dart';

abstract class UserDatasource {
  UserEntity? getCurrentUser();
  Future<ChildEntity?> getCurrentChild();
  Stream<ChildEntity>? getChildStream();
  Future<void> createChild(User userInstance, ChildEntity child);
  Future<void> updateUser(User userInstance, UserEntity user);
  Future<void> updateChild(User userInstance, ChildEntity child);
  Future<void> updateCurrentChild(ChildEntity child);
}
