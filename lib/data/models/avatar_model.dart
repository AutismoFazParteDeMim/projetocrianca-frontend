enum AvatarModelMouth {
  openedSmile,
  unimpressed,
  gapSmile,
  openSad,
  teethSmile,
  awkwardSmile,
  braces,
  kawaii
}

enum AvatarModelEye {
  cheery,
  normal,
  confused,
  starstruck,
  winking,
  sleepy,
  sad,
  angry
}

enum AvatarModelHairType {
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

enum AvatarModelAccessories {
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

enum AvatarModelSkinColor {
  variant01,
  variant02,
  variant03,
  variant04,
  variant05,
  variant06,
  variant07,
  variant08
}

enum AvatarModelHairColor {
  variant01,
  variant02,
  variant03,
  variant04,
  variant05,
  variant06,
  variant07,
  variant08
}

class AvatarModel {
  late AvatarModelMouth mouth;
  late AvatarModelEye eye;
  late AvatarModelHairType hair;
  late AvatarModelAccessories accessories;
  late AvatarModelSkinColor skinColor;
  late AvatarModelHairColor hairColor;

  AvatarModel({
    AvatarModelMouth? mouth,
    AvatarModelEye? eye,
    AvatarModelHairType? hair,
    AvatarModelAccessories? accessories,
    AvatarModelSkinColor? skinColor,
    AvatarModelHairColor? hairColor,
  }) {
    this.mouth = mouth ?? AvatarModelMouth.unimpressed;
    this.eye = eye ?? AvatarModelEye.normal;
    this.hair = hair ?? AvatarModelHairType.shavedHead;
    this.accessories = accessories ?? AvatarModelAccessories.none;
    this.skinColor = skinColor ?? AvatarModelSkinColor.variant01;
    this.hairColor = hairColor ?? AvatarModelHairColor.variant01;
  }
}
