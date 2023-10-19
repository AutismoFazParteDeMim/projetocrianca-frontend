import 'package:projeto_crianca/core/domain/entities/avatar_entity.dart';
import 'package:projeto_crianca/core/domain/entities/child_entity.dart';

abstract class AvatarRepository {
  Future<String?> getAvatar(AvatarEntity avatar);
  Future<void> saveAvatar(ChildEntity child);
  Future<ChildEntity?> getCurrentChild();
}
