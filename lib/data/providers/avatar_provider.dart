import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_crianca/data/models/avatar_model.dart';

class AvatarProvider {
  final Dio dio = Dio();

  static const String baseUrl =
      "https://avatars.dicebear.com/api/big-smile/:seed.svg";

  Future<String?> getAvatar(AvatarModel avatar) async {
    final Map<String, dynamic> params = {
      "mouth": avatar.mouth,
      "eye": avatar.eye,
      "hair": avatar.hair,
      "accessories": avatar.accessories,
      "skinColor": avatar.skinColor,
      "hairColor": avatar.hairColor,
    };

    return await dio
        .get(baseUrl, queryParameters: params)
        .then((value) => value.data);
  }
}
