import 'package:projeto_crianca/core/domain/entities/github_entity.dart';

abstract class ContributorsDatasource {
  Future<List<GitHubEntity?>?> getContributors();
}
