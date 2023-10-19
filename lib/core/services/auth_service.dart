import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/entities/user_entity.dart';
import 'package:projeto_crianca/core/domain/repositories/auth_repository.dart';
import 'package:projeto_crianca/core/routes/app_routes.dart';

class AuthService extends GetxService {
  AuthService(this.repository);

  final AuthRepository repository;
  final FirebaseAuth _instance = FirebaseAuth.instance;

  final Rx<User?> _user = Rx(null);
  final Rx<UserEntity?> _currentUser = Rx(null);
  final Rx<ChildEntity?> _currentChild = Rx(null);

  //getters
  UserEntity? get getCurrentUser => _currentUser.value;
  ChildEntity? get getCurrentChild => _currentChild.value;

  @override
  void onReady() {
    super.onReady();

    _user
      ..value = _instance.currentUser
      ..bindStream(_instance.authStateChanges());
    ever(_user, _toInitialPage);
  }

  Future<void> _toInitialPage(User? user) async {
    if (user == null) {
      await Get.offAllNamed<void>(AppRoutes.welcome);
    } else {
      _currentUser.value = repository.getCurrentUser();
      _currentChild.bindStream(repository.getChildStream()!);
      await Get.offAllNamed<void>(AppRoutes.home);
    }
  }

  Future<void> logOut() async {
    await repository.logOut();
  }
}
