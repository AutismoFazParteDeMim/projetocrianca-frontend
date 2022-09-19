import 'package:get/get.dart';
import 'package:projeto_crianca/bindings/home_page_binding.dart';
import 'package:projeto_crianca/bindings/login_page_binding.dart';
import 'package:projeto_crianca/bindings/profile_page_binding.dart';
import 'package:projeto_crianca/bindings/register_page_binding.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/pages/about_page.dart';
import 'package:projeto_crianca/ui/pages/activities_page.dart';
import 'package:projeto_crianca/ui/pages/games_page.dart';
import 'package:projeto_crianca/ui/pages/home_page.dart';
import 'package:projeto_crianca/ui/pages/localize_page.dart';
import 'package:projeto_crianca/ui/pages/login_page.dart';
import 'package:projeto_crianca/ui/pages/profile_page.dart';
import 'package:projeto_crianca/ui/pages/register_page.dart';
import 'package:projeto_crianca/ui/pages/settings_page.dart';
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
      binding: HomePageBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterPageBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: AppRoutes.activities,
      page: () => const ActivitiesPage(),
    ),
    GetPage(
      name: AppRoutes.games,
      page: () => const GamesPage(),
    ),
    GetPage(
      name: AppRoutes.localize,
      page: () => const LocalizePage(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsPage(),
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutPage(),
    ),
  ];
}
