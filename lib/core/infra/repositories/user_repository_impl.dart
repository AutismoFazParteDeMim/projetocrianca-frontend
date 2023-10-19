import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/entities/user_entity.dart';
import 'package:projeto_crianca/core/domain/repositories/user_repository.dart';
import 'package:projeto_crianca/core/infra/datasources/user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this.datasource);

  final UserDatasource datasource;

  @override
  UserEntity? getCurrentUser() {
    return datasource.getCurrentUser();
  }

  @override
  Future<ChildEntity?> getCurrentChild() async {
    return datasource.getCurrentChild();
  }

  @override
  Stream<ChildEntity>? getChildStream() {
    return datasource.getChildStream();
  }
}
