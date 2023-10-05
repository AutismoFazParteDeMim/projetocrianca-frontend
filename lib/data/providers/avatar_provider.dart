import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';

class AvatarProvider {
  final Dio _instance = Dio();

  static const String baseUrl = 'https://api.dicebear.com/7.x/big-smile/svg';

  Future<String?> getAvatar(AvatarModel avatar) async {
    final params = <String, dynamic>{
      'mouth': avatar.mouth.name,
      'eyes': avatar.eye.name,
      'hair': avatar.hair.name,
      // 'skinColor': avatar.skinColor.name,
      'hairColor': avatar.hairColor.name.split('v').last,
    }
      ..addIf(
        avatar.accessories != AvatarModelAccessories.none,
        'accessories',
        avatar.accessories.name,
      )
      ..addIf(
        avatar.accessories != AvatarModelAccessories.none,
        'accessoriesProbability',
        100,
      );

    final response = await _instance.get<dynamic>(
      baseUrl,
      queryParameters: params,
    );

    return response.data.toString();
  }
}
