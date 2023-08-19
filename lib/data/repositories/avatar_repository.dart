import 'package:projeto_crianca/data/models/avatar_model.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/providers/avatar_provider.dart';
import 'package:projeto_crianca/data/providers/user_provider.dart';

class AvatarRepository {
  AvatarRepository(this.avatarProvider, this.userProvider);

  final AvatarProvider avatarProvider;
  final UserProvider userProvider;

  Future<String?> getAvatar(AvatarModel avatar) async {
    return avatarProvider.getAvatar(avatar);
  }

  Future<void> saveAvatar(ChildModel child) async {
    return userProvider.updateCurrentChild(child);
  }

  Future<ChildModel?> getCurrentChild() async {
    return userProvider.getCurrentChild();
  }
}
