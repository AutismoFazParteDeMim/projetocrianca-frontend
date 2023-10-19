import 'package:projeto_crianca/core/domain/entities/github_entity.dart';

abstract class ContributorsRepository {
  Future<List<GitHubEntity?>?> getContributors();
}
