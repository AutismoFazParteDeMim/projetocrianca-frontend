// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'avatar_entity.dart';

class AvatarEntityMouthMapper extends EnumMapper<AvatarEntityMouth> {
  AvatarEntityMouthMapper._();

  static AvatarEntityMouthMapper? _instance;
  static AvatarEntityMouthMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvatarEntityMouthMapper._());
    }
    return _instance!;
  }

  static AvatarEntityMouth fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AvatarEntityMouth decode(dynamic value) {
    switch (value) {
      case 'openedSmile':
        return AvatarEntityMouth.openedSmile;
      case 'unimpressed':
        return AvatarEntityMouth.unimpressed;
      case 'gapSmile':
        return AvatarEntityMouth.gapSmile;
      case 'openSad':
        return AvatarEntityMouth.openSad;
      case 'teethSmile':
        return AvatarEntityMouth.teethSmile;
      case 'awkwardSmile':
        return AvatarEntityMouth.awkwardSmile;
      case 'braces':
        return AvatarEntityMouth.braces;
      case 'kawaii':
        return AvatarEntityMouth.kawaii;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AvatarEntityMouth self) {
    switch (self) {
      case AvatarEntityMouth.openedSmile:
        return 'openedSmile';
      case AvatarEntityMouth.unimpressed:
        return 'unimpressed';
      case AvatarEntityMouth.gapSmile:
        return 'gapSmile';
      case AvatarEntityMouth.openSad:
        return 'openSad';
      case AvatarEntityMouth.teethSmile:
        return 'teethSmile';
      case AvatarEntityMouth.awkwardSmile:
        return 'awkwardSmile';
      case AvatarEntityMouth.braces:
        return 'braces';
      case AvatarEntityMouth.kawaii:
        return 'kawaii';
    }
  }
}

extension AvatarEntityMouthMapperExtension on AvatarEntityMouth {
  String toValue() {
    AvatarEntityMouthMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AvatarEntityMouth>(this) as String;
  }
}

class AvatarEntityEyeMapper extends EnumMapper<AvatarEntityEye> {
  AvatarEntityEyeMapper._();

  static AvatarEntityEyeMapper? _instance;
  static AvatarEntityEyeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvatarEntityEyeMapper._());
    }
    return _instance!;
  }

  static AvatarEntityEye fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AvatarEntityEye decode(dynamic value) {
    switch (value) {
      case 'cheery':
        return AvatarEntityEye.cheery;
      case 'normal':
        return AvatarEntityEye.normal;
      case 'confused':
        return AvatarEntityEye.confused;
      case 'starstruck':
        return AvatarEntityEye.starstruck;
      case 'winking':
        return AvatarEntityEye.winking;
      case 'sleepy':
        return AvatarEntityEye.sleepy;
      case 'sad':
        return AvatarEntityEye.sad;
      case 'angry':
        return AvatarEntityEye.angry;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AvatarEntityEye self) {
    switch (self) {
      case AvatarEntityEye.cheery:
        return 'cheery';
      case AvatarEntityEye.normal:
        return 'normal';
      case AvatarEntityEye.confused:
        return 'confused';
      case AvatarEntityEye.starstruck:
        return 'starstruck';
      case AvatarEntityEye.winking:
        return 'winking';
      case AvatarEntityEye.sleepy:
        return 'sleepy';
      case AvatarEntityEye.sad:
        return 'sad';
      case AvatarEntityEye.angry:
        return 'angry';
    }
  }
}

extension AvatarEntityEyeMapperExtension on AvatarEntityEye {
  String toValue() {
    AvatarEntityEyeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AvatarEntityEye>(this) as String;
  }
}

class AvatarEntityHairTypeMapper extends EnumMapper<AvatarEntityHairType> {
  AvatarEntityHairTypeMapper._();

  static AvatarEntityHairTypeMapper? _instance;
  static AvatarEntityHairTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvatarEntityHairTypeMapper._());
    }
    return _instance!;
  }

  static AvatarEntityHairType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AvatarEntityHairType decode(dynamic value) {
    switch (value) {
      case 'shortHair':
        return AvatarEntityHairType.shortHair;
      case 'mohawk':
        return AvatarEntityHairType.mohawk;
      case 'wavyBob':
        return AvatarEntityHairType.wavyBob;
      case 'bowlCutHair':
        return AvatarEntityHairType.bowlCutHair;
      case 'curlyBob':
        return AvatarEntityHairType.curlyBob;
      case 'straightHair':
        return AvatarEntityHairType.straightHair;
      case 'braids':
        return AvatarEntityHairType.braids;
      case 'shavedHead':
        return AvatarEntityHairType.shavedHead;
      case 'bunHair':
        return AvatarEntityHairType.bunHair;
      case 'froBun':
        return AvatarEntityHairType.froBun;
      case 'bangs':
        return AvatarEntityHairType.bangs;
      case 'halfShavedHead':
        return AvatarEntityHairType.halfShavedHead;
      case 'curlyShortHair':
        return AvatarEntityHairType.curlyShortHair;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AvatarEntityHairType self) {
    switch (self) {
      case AvatarEntityHairType.shortHair:
        return 'shortHair';
      case AvatarEntityHairType.mohawk:
        return 'mohawk';
      case AvatarEntityHairType.wavyBob:
        return 'wavyBob';
      case AvatarEntityHairType.bowlCutHair:
        return 'bowlCutHair';
      case AvatarEntityHairType.curlyBob:
        return 'curlyBob';
      case AvatarEntityHairType.straightHair:
        return 'straightHair';
      case AvatarEntityHairType.braids:
        return 'braids';
      case AvatarEntityHairType.shavedHead:
        return 'shavedHead';
      case AvatarEntityHairType.bunHair:
        return 'bunHair';
      case AvatarEntityHairType.froBun:
        return 'froBun';
      case AvatarEntityHairType.bangs:
        return 'bangs';
      case AvatarEntityHairType.halfShavedHead:
        return 'halfShavedHead';
      case AvatarEntityHairType.curlyShortHair:
        return 'curlyShortHair';
    }
  }
}

extension AvatarEntityHairTypeMapperExtension on AvatarEntityHairType {
  String toValue() {
    AvatarEntityHairTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AvatarEntityHairType>(this)
        as String;
  }
}

class AvatarEntityAccessoriesMapper
    extends EnumMapper<AvatarEntityAccessories> {
  AvatarEntityAccessoriesMapper._();

  static AvatarEntityAccessoriesMapper? _instance;
  static AvatarEntityAccessoriesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AvatarEntityAccessoriesMapper._());
    }
    return _instance!;
  }

  static AvatarEntityAccessories fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AvatarEntityAccessories decode(dynamic value) {
    switch (value) {
      case 'catEars':
        return AvatarEntityAccessories.catEars;
      case 'glasses':
        return AvatarEntityAccessories.glasses;
      case 'sailormoonCrown':
        return AvatarEntityAccessories.sailormoonCrown;
      case 'clownNose':
        return AvatarEntityAccessories.clownNose;
      case 'sleepMask':
        return AvatarEntityAccessories.sleepMask;
      case 'sunglasses':
        return AvatarEntityAccessories.sunglasses;
      case 'faceMask':
        return AvatarEntityAccessories.faceMask;
      case 'mustache':
        return AvatarEntityAccessories.mustache;
      case 'none':
        return AvatarEntityAccessories.none;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AvatarEntityAccessories self) {
    switch (self) {
      case AvatarEntityAccessories.catEars:
        return 'catEars';
      case AvatarEntityAccessories.glasses:
        return 'glasses';
      case AvatarEntityAccessories.sailormoonCrown:
        return 'sailormoonCrown';
      case AvatarEntityAccessories.clownNose:
        return 'clownNose';
      case AvatarEntityAccessories.sleepMask:
        return 'sleepMask';
      case AvatarEntityAccessories.sunglasses:
        return 'sunglasses';
      case AvatarEntityAccessories.faceMask:
        return 'faceMask';
      case AvatarEntityAccessories.mustache:
        return 'mustache';
      case AvatarEntityAccessories.none:
        return 'none';
    }
  }
}

extension AvatarEntityAccessoriesMapperExtension on AvatarEntityAccessories {
  String toValue() {
    AvatarEntityAccessoriesMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AvatarEntityAccessories>(this)
        as String;
  }
}

class AvatarEntitySkinColorMapper extends EnumMapper<AvatarEntitySkinColor> {
  AvatarEntitySkinColorMapper._();

  static AvatarEntitySkinColorMapper? _instance;
  static AvatarEntitySkinColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvatarEntitySkinColorMapper._());
    }
    return _instance!;
  }

  static AvatarEntitySkinColor fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AvatarEntitySkinColor decode(dynamic value) {
    switch (value) {
      case 'vffe4c0':
        return AvatarEntitySkinColor.vffe4c0;
      case 'vf5d7b1':
        return AvatarEntitySkinColor.vf5d7b1;
      case 'vefcc9f':
        return AvatarEntitySkinColor.vefcc9f;
      case 've2ba87':
        return AvatarEntitySkinColor.ve2ba87;
      case 'vc99c62':
        return AvatarEntitySkinColor.vc99c62;
      case 'va47539':
        return AvatarEntitySkinColor.va47539;
      case 'v8c5a2b':
        return AvatarEntitySkinColor.v8c5a2b;
      case 'v643d19':
        return AvatarEntitySkinColor.v643d19;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AvatarEntitySkinColor self) {
    switch (self) {
      case AvatarEntitySkinColor.vffe4c0:
        return 'vffe4c0';
      case AvatarEntitySkinColor.vf5d7b1:
        return 'vf5d7b1';
      case AvatarEntitySkinColor.vefcc9f:
        return 'vefcc9f';
      case AvatarEntitySkinColor.ve2ba87:
        return 've2ba87';
      case AvatarEntitySkinColor.vc99c62:
        return 'vc99c62';
      case AvatarEntitySkinColor.va47539:
        return 'va47539';
      case AvatarEntitySkinColor.v8c5a2b:
        return 'v8c5a2b';
      case AvatarEntitySkinColor.v643d19:
        return 'v643d19';
    }
  }
}

extension AvatarEntitySkinColorMapperExtension on AvatarEntitySkinColor {
  String toValue() {
    AvatarEntitySkinColorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AvatarEntitySkinColor>(this)
        as String;
  }
}

class AvatarEntityHairColorMapper extends EnumMapper<AvatarEntityHairColor> {
  AvatarEntityHairColorMapper._();

  static AvatarEntityHairColorMapper? _instance;
  static AvatarEntityHairColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvatarEntityHairColorMapper._());
    }
    return _instance!;
  }

  static AvatarEntityHairColor fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AvatarEntityHairColor decode(dynamic value) {
    switch (value) {
      case 'v220f00':
        return AvatarEntityHairColor.v220f00;
      case 'v3a1a00':
        return AvatarEntityHairColor.v3a1a00;
      case 'v71472d':
        return AvatarEntityHairColor.v71472d;
      case 've2ba87':
        return AvatarEntityHairColor.ve2ba87;
      case 'v605de4':
        return AvatarEntityHairColor.v605de4;
      case 'v238d80':
        return AvatarEntityHairColor.v238d80;
      case 'vd56c0c':
        return AvatarEntityHairColor.vd56c0c;
      case 've9b729':
        return AvatarEntityHairColor.ve9b729;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AvatarEntityHairColor self) {
    switch (self) {
      case AvatarEntityHairColor.v220f00:
        return 'v220f00';
      case AvatarEntityHairColor.v3a1a00:
        return 'v3a1a00';
      case AvatarEntityHairColor.v71472d:
        return 'v71472d';
      case AvatarEntityHairColor.ve2ba87:
        return 've2ba87';
      case AvatarEntityHairColor.v605de4:
        return 'v605de4';
      case AvatarEntityHairColor.v238d80:
        return 'v238d80';
      case AvatarEntityHairColor.vd56c0c:
        return 'vd56c0c';
      case AvatarEntityHairColor.ve9b729:
        return 've9b729';
    }
  }
}

extension AvatarEntityHairColorMapperExtension on AvatarEntityHairColor {
  String toValue() {
    AvatarEntityHairColorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AvatarEntityHairColor>(this)
        as String;
  }
}

class AvatarEntityMapper extends ClassMapperBase<AvatarEntity> {
  AvatarEntityMapper._();

  static AvatarEntityMapper? _instance;
  static AvatarEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvatarEntityMapper._());
      AvatarEntityMouthMapper.ensureInitialized();
      AvatarEntityEyeMapper.ensureInitialized();
      AvatarEntityHairTypeMapper.ensureInitialized();
      AvatarEntityAccessoriesMapper.ensureInitialized();
      AvatarEntitySkinColorMapper.ensureInitialized();
      AvatarEntityHairColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'AvatarEntity';

  static AvatarEntityMouth _$mouth(AvatarEntity v) => v.mouth;
  static const Field<AvatarEntity, AvatarEntityMouth> _f$mouth =
      Field('mouth', _$mouth, opt: true, def: AvatarEntityMouth.unimpressed);
  static AvatarEntityEye _$eye(AvatarEntity v) => v.eye;
  static const Field<AvatarEntity, AvatarEntityEye> _f$eye =
      Field('eye', _$eye, opt: true, def: AvatarEntityEye.normal);
  static AvatarEntityHairType _$hair(AvatarEntity v) => v.hair;
  static const Field<AvatarEntity, AvatarEntityHairType> _f$hair =
      Field('hair', _$hair, opt: true, def: AvatarEntityHairType.shavedHead);
  static AvatarEntityAccessories _$accessories(AvatarEntity v) => v.accessories;
  static const Field<AvatarEntity, AvatarEntityAccessories> _f$accessories =
      Field('accessories', _$accessories,
          opt: true, def: AvatarEntityAccessories.none);
  static AvatarEntitySkinColor _$skinColor(AvatarEntity v) => v.skinColor;
  static const Field<AvatarEntity, AvatarEntitySkinColor> _f$skinColor = Field(
      'skinColor', _$skinColor,
      opt: true, def: AvatarEntitySkinColor.vffe4c0);
  static AvatarEntityHairColor _$hairColor(AvatarEntity v) => v.hairColor;
  static const Field<AvatarEntity, AvatarEntityHairColor> _f$hairColor = Field(
      'hairColor', _$hairColor,
      opt: true, def: AvatarEntityHairColor.v220f00);

  @override
  final Map<Symbol, Field<AvatarEntity, dynamic>> fields = const {
    #mouth: _f$mouth,
    #eye: _f$eye,
    #hair: _f$hair,
    #accessories: _f$accessories,
    #skinColor: _f$skinColor,
    #hairColor: _f$hairColor,
  };

  static AvatarEntity _instantiate(DecodingData data) {
    return AvatarEntity(
        mouth: data.dec(_f$mouth),
        eye: data.dec(_f$eye),
        hair: data.dec(_f$hair),
        accessories: data.dec(_f$accessories),
        skinColor: data.dec(_f$skinColor),
        hairColor: data.dec(_f$hairColor));
  }

  @override
  final Function instantiate = _instantiate;

  static AvatarEntity fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<AvatarEntity>(map));
  }

  static AvatarEntity fromJson(String json) {
    return _guard((c) => c.fromJson<AvatarEntity>(json));
  }
}

mixin AvatarEntityMappable {
  String toJson() {
    return AvatarEntityMapper._guard((c) => c.toJson(this as AvatarEntity));
  }

  Map<String, dynamic> toMap() {
    return AvatarEntityMapper._guard((c) => c.toMap(this as AvatarEntity));
  }

  AvatarEntityCopyWith<AvatarEntity, AvatarEntity, AvatarEntity> get copyWith =>
      _AvatarEntityCopyWithImpl(this as AvatarEntity, $identity, $identity);
  @override
  String toString() {
    return AvatarEntityMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AvatarEntityMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AvatarEntityMapper._guard((c) => c.hash(this));
  }
}

extension AvatarEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AvatarEntity, $Out> {
  AvatarEntityCopyWith<$R, AvatarEntity, $Out> get $asAvatarEntity =>
      $base.as((v, t, t2) => _AvatarEntityCopyWithImpl(v, t, t2));
}

abstract class AvatarEntityCopyWith<$R, $In extends AvatarEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {AvatarEntityMouth? mouth,
      AvatarEntityEye? eye,
      AvatarEntityHairType? hair,
      AvatarEntityAccessories? accessories,
      AvatarEntitySkinColor? skinColor,
      AvatarEntityHairColor? hairColor});
  AvatarEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AvatarEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AvatarEntity, $Out>
    implements AvatarEntityCopyWith<$R, AvatarEntity, $Out> {
  _AvatarEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AvatarEntity> $mapper =
      AvatarEntityMapper.ensureInitialized();
  @override
  $R call(
          {AvatarEntityMouth? mouth,
          AvatarEntityEye? eye,
          AvatarEntityHairType? hair,
          AvatarEntityAccessories? accessories,
          AvatarEntitySkinColor? skinColor,
          AvatarEntityHairColor? hairColor}) =>
      $apply(FieldCopyWithData({
        if (mouth != null) #mouth: mouth,
        if (eye != null) #eye: eye,
        if (hair != null) #hair: hair,
        if (accessories != null) #accessories: accessories,
        if (skinColor != null) #skinColor: skinColor,
        if (hairColor != null) #hairColor: hairColor
      }));
  @override
  AvatarEntity $make(CopyWithData data) => AvatarEntity(
      mouth: data.get(#mouth, or: $value.mouth),
      eye: data.get(#eye, or: $value.eye),
      hair: data.get(#hair, or: $value.hair),
      accessories: data.get(#accessories, or: $value.accessories),
      skinColor: data.get(#skinColor, or: $value.skinColor),
      hairColor: data.get(#hairColor, or: $value.hairColor));

  @override
  AvatarEntityCopyWith<$R2, AvatarEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AvatarEntityCopyWithImpl($value, $cast, t);
}
