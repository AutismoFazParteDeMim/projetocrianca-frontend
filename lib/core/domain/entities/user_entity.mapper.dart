// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'user_entity.dart';

class UserEntityMapper extends ClassMapperBase<UserEntity> {
  UserEntityMapper._();

  static UserEntityMapper? _instance;
  static UserEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserEntityMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'UserEntity';

  static String? _$uid(UserEntity v) => v.uid;
  static const Field<UserEntity, String> _f$uid =
      Field('uid', _$uid, opt: true);
  static String? _$name(UserEntity v) => v.name;
  static const Field<UserEntity, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$email(UserEntity v) => v.email;
  static const Field<UserEntity, String> _f$email =
      Field('email', _$email, opt: true);
  static bool? _$isEmailVerified(UserEntity v) => v.isEmailVerified;
  static const Field<UserEntity, bool> _f$isEmailVerified =
      Field('isEmailVerified', _$isEmailVerified, opt: true);
  static String? _$photoURL(UserEntity v) => v.photoURL;
  static const Field<UserEntity, String> _f$photoURL =
      Field('photoURL', _$photoURL, mode: FieldMode.member);

  @override
  final Map<Symbol, Field<UserEntity, dynamic>> fields = const {
    #uid: _f$uid,
    #name: _f$name,
    #email: _f$email,
    #isEmailVerified: _f$isEmailVerified,
    #photoURL: _f$photoURL,
  };

  static UserEntity _instantiate(DecodingData data) {
    return UserEntity(
        uid: data.dec(_f$uid),
        name: data.dec(_f$name),
        email: data.dec(_f$email),
        isEmailVerified: data.dec(_f$isEmailVerified));
  }

  @override
  final Function instantiate = _instantiate;

  static UserEntity fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<UserEntity>(map));
  }

  static UserEntity fromJson(String json) {
    return _guard((c) => c.fromJson<UserEntity>(json));
  }
}

mixin UserEntityMappable {
  String toJson() {
    return UserEntityMapper._guard((c) => c.toJson(this as UserEntity));
  }

  Map<String, dynamic> toMap() {
    return UserEntityMapper._guard((c) => c.toMap(this as UserEntity));
  }

  UserEntityCopyWith<UserEntity, UserEntity, UserEntity> get copyWith =>
      _UserEntityCopyWithImpl(this as UserEntity, $identity, $identity);
  @override
  String toString() {
    return UserEntityMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserEntityMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return UserEntityMapper._guard((c) => c.hash(this));
  }
}

extension UserEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserEntity, $Out> {
  UserEntityCopyWith<$R, UserEntity, $Out> get $asUserEntity =>
      $base.as((v, t, t2) => _UserEntityCopyWithImpl(v, t, t2));
}

abstract class UserEntityCopyWith<$R, $In extends UserEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? uid, String? name, String? email, bool? isEmailVerified});
  UserEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserEntity, $Out>
    implements UserEntityCopyWith<$R, UserEntity, $Out> {
  _UserEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserEntity> $mapper =
      UserEntityMapper.ensureInitialized();
  @override
  $R call(
          {Object? uid = $none,
          Object? name = $none,
          Object? email = $none,
          Object? isEmailVerified = $none}) =>
      $apply(FieldCopyWithData({
        if (uid != $none) #uid: uid,
        if (name != $none) #name: name,
        if (email != $none) #email: email,
        if (isEmailVerified != $none) #isEmailVerified: isEmailVerified
      }));
  @override
  UserEntity $make(CopyWithData data) => UserEntity(
      uid: data.get(#uid, or: $value.uid),
      name: data.get(#name, or: $value.name),
      email: data.get(#email, or: $value.email),
      isEmailVerified: data.get(#isEmailVerified, or: $value.isEmailVerified));

  @override
  UserEntityCopyWith<$R2, UserEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserEntityCopyWithImpl($value, $cast, t);
}
