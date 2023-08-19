// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:projeto_crianca/data/models/github_model.dart';

class GitHubProvider {
  final Dio dio = Dio();
  final String baseUrl =
      'https://api.github.com/repos/AutismoFazParteDeMim/ProjetoCrianca/contributors';

  Future<List<GitHubModel?>?> getContributors() async {
    final response = await dio.get<dynamic>(baseUrl).then(
          (value) => value.data,
        ) as List<dynamic>?;

    if (response != null) {
      final contributors = <GitHubModel?>[];

      for (final element in response) {
        contributors.add(
          GitHubModel(
            user: element['login'] as String?,
            photoUrl: element['avatar_url'] as String?,
            profileUrl: element['html_url'] as String?,
          ),
        );
      }

      return contributors;
    }

    return null;
  }
}
