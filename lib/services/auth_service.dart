import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/models/user_model.dart';
import 'package:projeto_crianca/data/repositories/auth_repository.dart';
import 'package:projeto_crianca/routes/app_routes.dart';

class AuthService extends GetxService {
  AuthService(this.repository);

  final AuthRepository repository;
  final FirebaseAuth _instance = FirebaseAuth.instance;

  final Rx<User?> _user = Rx(null);
  final Rx<UserModel?> _currentUser = Rx(null);
  final Rx<ChildModel?> _currentChild = Rx(null);

  //getters
  UserModel? get getCurrentUser => _currentUser.value;
  ChildModel? get getCurrentChild => _currentChild.value;

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
