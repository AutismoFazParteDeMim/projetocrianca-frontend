import 'package:projeto_crianca/core/domain/entities/avatar_entity.dart';
import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/infra/datasources/user_datasource.dart';
import 'package:projeto_crianca/modules/avatar/domain/repositories/avatar_repository.dart';
import 'package:projeto_crianca/modules/avatar/infra/datasources/avatar_datasource.dart';

class AvatarRepositoryImpl implements AvatarRepository {
  const AvatarRepositoryImpl(
    this.avatarDatasource,
    this.userDatasource,
  );

  final AvatarDatasource avatarDatasource;
  final UserDatasource userDatasource;

  @override
  Future<String?> getAvatar(AvatarEntity avatar) async {
    return avatarDatasource.getAvatar(avatar);
  }

  @override
  Future<void> saveAvatar(ChildEntity child) async {
    return userDatasource.updateCurrentChild(child);
  }

  @override
  Future<ChildEntity?> getCurrentChild() async {
    return userDatasource.getCurrentChild();
  }
}
