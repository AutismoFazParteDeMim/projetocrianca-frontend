import 'package:projeto_crianca/core/domain/entities/github_entity.dart';
import 'package:projeto_crianca/modules/settings/domain/repositories/contributors_repository.dart';
import 'package:projeto_crianca/modules/settings/infra/datasources/contributors_datasource.dart';

class ContributorsRepositoryImpl implements ContributorsRepository {
  const ContributorsRepositoryImpl(this.datasource);

  final ContributorsDatasource datasource;

  @override
  Future<List<GitHubEntity?>?> getContributors() async {
    return datasource.getContributors();
  }
}
