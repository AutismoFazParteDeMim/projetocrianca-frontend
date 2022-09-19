import 'package:projeto_crianca/data/models/avatar_model.dart';
import 'package:projeto_crianca/data/providers/avatar_provider.dart';

class AvatarRepository {
  final AvatarProvider provider;

  AvatarRepository(this.provider);

  Future<String?> getAvatar(AvatarModel avatar) async {
    return await provider.getAvatar(avatar);
  }
}
