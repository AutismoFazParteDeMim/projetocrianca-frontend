import 'package:projeto_crianca/data/models/github_model.dart';
import 'package:projeto_crianca/data/providers/github_provider.dart';

class GitHubRepository {
  final GitHubProvider provider;

  GitHubRepository(this.provider);

  Future<List<GitHubModel?>?> getContributors() async {
    return await provider.getContributors();
  }
}
