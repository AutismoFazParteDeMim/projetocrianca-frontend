import 'package:dart_mappable/dart_mappable.dart';

part 'user_entity.mapper.dart';

@MappableClass()
class UserEntity with UserEntityMappable {
  UserEntity({
    this.uid,
    this.name,
    this.email,
    this.isEmailVerified,
    this.photoURL,
  });

  final String? uid;
  final String? name;
  final String? email;
  final bool? isEmailVerified;
  final String? photoURL;
}
