import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';

class AvatarProvider {
  final Dio _instance = Dio();

  static const String baseUrl =
      "https://avatars.dicebear.com/api/big-smile/:seed.svg";

  Future<String?> getAvatar(AvatarModel avatar) async {
    final Map<String, dynamic> params = {
      "mouth": avatar.mouth.name,
      "eyes": avatar.eye.name,
      "hair": avatar.hair.name,
      "skinColor": avatar.skinColor.name,
      "hairColor": avatar.hairColor.name,
    };

    params.addIf(
      avatar.accessories != AvatarModelAccessories.none,
      "accessories",
      avatar.accessories.name,
    );

    params.addIf(
      avatar.accessories == AvatarModelAccessories.none,
      "accessoriesProbability",
      0,
    );

    final response = await _instance.get(baseUrl, queryParameters: params);
    return response.data.toString();
  }
}
