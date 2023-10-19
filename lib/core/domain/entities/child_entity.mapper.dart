// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'child_entity.dart';

class ChildEntityMapper extends ClassMapperBase<ChildEntity> {
  ChildEntityMapper._();

  static ChildEntityMapper? _instance;
  static ChildEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChildEntityMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ChildEntity';

  static String? _$name(ChildEntity v) => v.name;
  static const Field<ChildEntity, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$sex(ChildEntity v) => v.sex;
  static const Field<ChildEntity, String> _f$sex =
      Field('sex', _$sex, opt: true);
  static String? _$photoURL(ChildEntity v) => v.photoURL;
  static const Field<ChildEntity, String> _f$photoURL =
      Field('photoURL', _$photoURL, opt: true);

  @override
  final Map<Symbol, Field<ChildEntity, dynamic>> fields = const {
    #name: _f$name,
    #sex: _f$sex,
    #photoURL: _f$photoURL,
  };

  static ChildEntity _instantiate(DecodingData data) {
    return ChildEntity(
        name: data.dec(_f$name),
        sex: data.dec(_f$sex),
        photoURL: data.dec(_f$photoURL));
  }

  @override
  final Function instantiate = _instantiate;

  static ChildEntity fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ChildEntity>(map));
  }

  static ChildEntity fromJson(String json) {
    return _guard((c) => c.fromJson<ChildEntity>(json));
  }
}

mixin ChildEntityMappable {
  String toJson() {
    return ChildEntityMapper._guard((c) => c.toJson(this as ChildEntity));
  }

  Map<String, dynamic> toMap() {
    return ChildEntityMapper._guard((c) => c.toMap(this as ChildEntity));
  }

  ChildEntityCopyWith<ChildEntity, ChildEntity, ChildEntity> get copyWith =>
      _ChildEntityCopyWithImpl(this as ChildEntity, $identity, $identity);
  @override
  String toString() {
    return ChildEntityMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ChildEntityMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ChildEntityMapper._guard((c) => c.hash(this));
  }
}

extension ChildEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChildEntity, $Out> {
  ChildEntityCopyWith<$R, ChildEntity, $Out> get $asChildEntity =>
      $base.as((v, t, t2) => _ChildEntityCopyWithImpl(v, t, t2));
}

abstract class ChildEntityCopyWith<$R, $In extends ChildEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? sex, String? photoURL});
  ChildEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChildEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChildEntity, $Out>
    implements ChildEntityCopyWith<$R, ChildEntity, $Out> {
  _ChildEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChildEntity> $mapper =
      ChildEntityMapper.ensureInitialized();
  @override
  $R call(
          {Object? name = $none,
          Object? sex = $none,
          Object? photoURL = $none}) =>
      $apply(FieldCopyWithData({
        if (name != $none) #name: name,
        if (sex != $none) #sex: sex,
        if (photoURL != $none) #photoURL: photoURL
      }));
  @override
  ChildEntity $make(CopyWithData data) => ChildEntity(
      name: data.get(#name, or: $value.name),
      sex: data.get(#sex, or: $value.sex),
      photoURL: data.get(#photoURL, or: $value.photoURL));

  @override
  ChildEntityCopyWith<$R2, ChildEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChildEntityCopyWithImpl($value, $cast, t);
}
