import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/domain/entities/avatar_entity.dart';
import 'package:projeto_crianca/modules/avatar/infra/datasources/avatar_datasource.dart';

class DicebearDatasourceImpl implements AvatarDatasource {
  const DicebearDatasourceImpl(this._dio);

  final Dio _dio;
  static const String baseUrl = 'https://api.dicebear.com/7.x/big-smile/svg';

  @override
  Future<String?> getAvatar(AvatarEntity avatar) async {
    final params = <String, dynamic>{
      'mouth': avatar.mouth.name,
      'eyes': avatar.eye.name,
      'hair': avatar.hair.name,
      'skinColor': avatar.skinColor.name.split('v').last,
      'hairColor': avatar.hairColor.name.split('v').last,
    }
      ..addIf(
        avatar.accessories != AvatarEntityAccessories.none,
        'accessories',
        avatar.accessories.name,
      )
      ..addIf(
        avatar.accessories != AvatarEntityAccessories.none,
        'accessoriesProbability',
        100,
      );

    final response = await _dio.get<dynamic>(
      baseUrl,
      queryParameters: params,
    );

    return response.data.toString();
  }
}
