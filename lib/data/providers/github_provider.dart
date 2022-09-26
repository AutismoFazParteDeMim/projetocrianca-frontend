import 'package:dio/dio.dart';
import 'package:projeto_crianca/data/models/github_model.dart';

class GitHubProvider {
  final Dio dio = Dio();
  final String baseUrl =
      "https://api.github.com/repos/AutismoFazParteDeMim/ProjetoCrianca/contributors";

  Future<List<GitHubModel?>?> getContributors() async {
    final List<dynamic>? response = await dio.get(baseUrl).then(
          (value) => value.data,
        );

    if (response != null) {
      final List<GitHubModel?> contributors = [];

      for (var element in response) {
        contributors.add(GitHubModel(
          user: element["login"],
          photoUrl: element["avatar_url"],
          profileUrl: element["html_url"],
        ));
      }

      return contributors;
    }

    return null;
  }
}
