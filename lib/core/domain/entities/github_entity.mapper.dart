// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'github_entity.dart';

class GitHubEntityMapper extends ClassMapperBase<GitHubEntity> {
  GitHubEntityMapper._();

  static GitHubEntityMapper? _instance;
  static GitHubEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GitHubEntityMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'GitHubEntity';

  static String? _$user(GitHubEntity v) => v.user;
  static const Field<GitHubEntity, String> _f$user =
      Field('user', _$user, opt: true);
  static String? _$photoUrl(GitHubEntity v) => v.photoUrl;
  static const Field<GitHubEntity, String> _f$photoUrl =
      Field('photoUrl', _$photoUrl, opt: true);
  static String? _$profileUrl(GitHubEntity v) => v.profileUrl;
  static const Field<GitHubEntity, String> _f$profileUrl =
      Field('profileUrl', _$profileUrl, opt: true);

  @override
  final Map<Symbol, Field<GitHubEntity, dynamic>> fields = const {
    #user: _f$user,
    #photoUrl: _f$photoUrl,
    #profileUrl: _f$profileUrl,
  };

  static GitHubEntity _instantiate(DecodingData data) {
    return GitHubEntity(
        user: data.dec(_f$user),
        photoUrl: data.dec(_f$photoUrl),
        profileUrl: data.dec(_f$profileUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static GitHubEntity fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<GitHubEntity>(map));
  }

  static GitHubEntity fromJson(String json) {
    return _guard((c) => c.fromJson<GitHubEntity>(json));
  }
}

mixin GitHubEntityMappable {
  String toJson() {
    return GitHubEntityMapper._guard((c) => c.toJson(this as GitHubEntity));
  }

  Map<String, dynamic> toMap() {
    return GitHubEntityMapper._guard((c) => c.toMap(this as GitHubEntity));
  }

  GitHubEntityCopyWith<GitHubEntity, GitHubEntity, GitHubEntity> get copyWith =>
      _GitHubEntityCopyWithImpl(this as GitHubEntity, $identity, $identity);
  @override
  String toString() {
    return GitHubEntityMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GitHubEntityMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return GitHubEntityMapper._guard((c) => c.hash(this));
  }
}

extension GitHubEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GitHubEntity, $Out> {
  GitHubEntityCopyWith<$R, GitHubEntity, $Out> get $asGitHubEntity =>
      $base.as((v, t, t2) => _GitHubEntityCopyWithImpl(v, t, t2));
}

abstract class GitHubEntityCopyWith<$R, $In extends GitHubEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? user, String? photoUrl, String? profileUrl});
  GitHubEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GitHubEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GitHubEntity, $Out>
    implements GitHubEntityCopyWith<$R, GitHubEntity, $Out> {
  _GitHubEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GitHubEntity> $mapper =
      GitHubEntityMapper.ensureInitialized();
  @override
  $R call(
          {Object? user = $none,
          Object? photoUrl = $none,
          Object? profileUrl = $none}) =>
      $apply(FieldCopyWithData({
        if (user != $none) #user: user,
        if (photoUrl != $none) #photoUrl: photoUrl,
        if (profileUrl != $none) #profileUrl: profileUrl
      }));
  @override
  GitHubEntity $make(CopyWithData data) => GitHubEntity(
      user: data.get(#user, or: $value.user),
      photoUrl: data.get(#photoUrl, or: $value.photoUrl),
      profileUrl: data.get(#profileUrl, or: $value.profileUrl));

  @override
  GitHubEntityCopyWith<$R2, GitHubEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GitHubEntityCopyWithImpl($value, $cast, t);
}
