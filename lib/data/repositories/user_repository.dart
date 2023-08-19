import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/models/user_model.dart';
import 'package:projeto_crianca/data/providers/user_provider.dart';

class UserRepository {
  UserRepository(this.provider);

  final UserProvider provider;

  UserModel? getCurrentUser() {
    return provider.getCurrentUser();
  }

  Future<ChildModel?> getCurrentChild() async {
    return provider.getCurrentChild();
  }

  Stream<ChildModel>? getChildStream() {
    return provider.getChildStream();
  }
}
