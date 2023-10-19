// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:projeto_crianca/core/domain/entities/github_entity.dart';
import 'package:projeto_crianca/modules/settings/infra/datasources/contributors_datasource.dart';

class GitHubDatasourceImpl implements ContributorsDatasource {
  final Dio dio = Dio();
  final String baseUrl =
      'https://api.github.com/repos/AutismoFazParteDeMim/ProjetoCrianca/contributors';

  @override
  Future<List<GitHubEntity?>?> getContributors() async {
    final response = await dio.get<dynamic>(baseUrl).then(
          (value) => value.data,
        ) as List<dynamic>?;

    if (response != null) {
      final contributors = <GitHubEntity?>[];

      for (final element in response) {
        contributors.add(
          GitHubEntity(
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
