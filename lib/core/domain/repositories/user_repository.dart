import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/entities/user_entity.dart';

abstract class UserRepository {
  UserEntity? getCurrentUser();
  Future<ChildEntity?> getCurrentChild();
  Stream<ChildEntity>? getChildStream();
}
