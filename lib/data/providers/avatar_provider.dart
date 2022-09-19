import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';

class AvatarProvider {
  final Dio _instance = Dio();

  static const String baseUrl =
      "https://avatars.dicebear.com/api/big-smile/:seed.svg";

  Future<String?> getAvatar(AvatarModel avatar) async {
    final Map<String, dynamic> params = {
      "mouth": avatar.mouth.name,
      "eye": avatar.eye.name,
      "hair": avatar.hair.name,
      "accessories": avatar.accessories.name,
      "skinColor": avatar.skinColor.name,
      "hairColor": avatar.hairColor.name,
    };

    try {
      final response = await _instance.get(baseUrl, queryParameters: params);
      return response.data.toString();
    } catch (e) {
      log(e.toString());
    }

    return null;
  }
}
