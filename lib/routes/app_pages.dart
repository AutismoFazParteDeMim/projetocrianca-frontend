import 'package:get/get.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/pages/home_page.dart';
import 'package:projeto_crianca/ui/pages/login_page.dart';
import 'package:projeto_crianca/ui/pages/register_page.dart';
import 'package:projeto_crianca/ui/pages/welcome_page.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
    ),
  ];
}
