import 'package:get/get.dart';
import 'package:projeto_crianca/data/repositorys/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final AuthRepository repository;

  AuthController(this.repository);
}
