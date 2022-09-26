import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/data/repositorys/auth_repository.dart';
import 'package:projeto_crianca/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  static final FirebaseAuth _instance = FirebaseAuth.instance;

  late Rx<User?> _user;

  AuthController(this.repository);

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(_instance.currentUser);
    _user.bindStream(_instance.authStateChanges());
    ever(_user, _toInitialPage);
  }

  void _toInitialPage(User? user) {
    if (user == null) {
      Get.offAllNamed(AppRoutes.initial);
    } else {
      Get.offAllNamed(AppRoutes.home);
    }
  }

  Future<void> logOut() async {
    await repository.logOut();
  }
}
