import 'package:dart_mappable/dart_mappable.dart';

part 'github_entity.mapper.dart';

@MappableClass()
class GitHubEntity with GitHubEntityMappable {
  GitHubEntity({
    this.user,
    this.photoUrl,
    this.profileUrl,
  });

  final String? user;
  final String? photoUrl;
  final String? profileUrl;
}
