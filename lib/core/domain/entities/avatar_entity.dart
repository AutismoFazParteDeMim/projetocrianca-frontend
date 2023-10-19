import 'package:dart_mappable/dart_mappable.dart';

part 'avatar_entity.mapper.dart';

@MappableClass()
class AvatarEntity with AvatarEntityMappable {
  AvatarEntity({
    this.mouth = AvatarEntityMouth.unimpressed,
    this.eye = AvatarEntityEye.normal,
    this.hair = AvatarEntityHairType.shavedHead,
    this.accessories = AvatarEntityAccessories.none,
    this.skinColor = AvatarEntitySkinColor.vffe4c0,
    this.hairColor = AvatarEntityHairColor.v220f00,
  });

  final AvatarEntityMouth mouth;
  final AvatarEntityEye eye;
  final AvatarEntityHairType hair;
  final AvatarEntityAccessories accessories;
  final AvatarEntitySkinColor skinColor;
  final AvatarEntityHairColor hairColor;
}

@MappableEnum()
enum AvatarEntityMouth {
  openedSmile,
  unimpressed,
  gapSmile,
  openSad,
  teethSmile,
  awkwardSmile,
  braces,
  kawaii
}

@MappableEnum()
enum AvatarEntityEye {
  cheery,
  normal,
  confused,
  starstruck,
  winking,
  sleepy,
  sad,
  angry
}

@MappableEnum()
enum AvatarEntityHairType {
  shortHair,
  mohawk,
  wavyBob,
  bowlCutHair,
  curlyBob,
  straightHair,
  braids,
  shavedHead,
  bunHair,
  froBun,
  bangs,
  halfShavedHead,
  curlyShortHair
}

@MappableEnum()
enum AvatarEntityAccessories {
  catEars,
  glasses,
  sailormoonCrown,
  clownNose,
  sleepMask,
  sunglasses,
  faceMask,
  mustache,
  none,
}

@MappableEnum()
enum AvatarEntitySkinColor {
  vffe4c0,
  vf5d7b1,
  vefcc9f,
  ve2ba87,
  vc99c62,
  va47539,
  v8c5a2b,
  v643d19,
}

@MappableEnum()
enum AvatarEntityHairColor {
  v220f00,
  v3a1a00,
  v71472d,
  ve2ba87,
  v605de4,
  v238d80,
  vd56c0c,
  ve9b729
}
