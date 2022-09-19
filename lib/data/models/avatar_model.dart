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
  mustache
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
  final AvatarModelMouth? mouth;
  final AvatarModelEye? eye;
  final AvatarModelHairType? hair;
  final AvatarModelAccessories? accessories;
  final AvatarModelSkinColor? skinColor;
  final AvatarModelHairColor? hairColor;

  AvatarModel({
    this.mouth,
    this.eye,
    this.hair,
    this.accessories,
    this.skinColor,
    this.hairColor,
  });

  factory AvatarModel.fromJson(Map<String, dynamic> json) {
    return AvatarModel(
      mouth: json['mouth'],
      eye: json['eye'],
      hair: json['hair'],
      accessories: json['accessories'],
      skinColor: json['skinColor'],
      hairColor: json['hairColor'],
    );
  }
}
