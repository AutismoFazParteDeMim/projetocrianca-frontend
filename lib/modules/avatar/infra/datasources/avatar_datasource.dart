import 'package:projeto_crianca/core/domain/entities/avatar_entity.dart';

abstract class AvatarDatasource {
  Future<String?> getAvatar(AvatarEntity avatar);
}
