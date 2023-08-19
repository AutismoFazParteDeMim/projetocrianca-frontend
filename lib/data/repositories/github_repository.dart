import 'package:projeto_crianca/data/models/github_model.dart';
import 'package:projeto_crianca/data/providers/github_provider.dart';

class GitHubRepository {
  GitHubRepository(this.provider);

  final GitHubProvider provider;

  Future<List<GitHubModel?>?> getContributors() async {
    return provider.getContributors();
  }
}
