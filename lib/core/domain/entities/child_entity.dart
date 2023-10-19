import 'package:dart_mappable/dart_mappable.dart';

part 'child_entity.mapper.dart';

@MappableClass()
class ChildEntity with ChildEntityMappable {
  ChildEntity({
    this.name,
    this.sex,
    this.photoURL,
  });

  final String? name;
  final String? sex;
  final String? photoURL;
}
