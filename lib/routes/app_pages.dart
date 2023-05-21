import 'package:get/get.dart';
import 'package:projeto_crianca/bindings/about_page_binding.dart';
import 'package:projeto_crianca/bindings/avatar_page_binding.dart';
import 'package:projeto_crianca/bindings/games/paint_game_page_binding.dart';
import 'package:projeto_crianca/bindings/home_page_binding.dart';
import 'package:projeto_crianca/bindings/localize_page_binding.dart';
import 'package:projeto_crianca/bindings/login_page_binding.dart';
import 'package:projeto_crianca/bindings/profile_page_binding.dart';
import 'package:projeto_crianca/bindings/register_page_binding.dart';
import 'package:projeto_crianca/bindings/settings_page_binding.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_page.dart';
import 'package:projeto_crianca/ui/pages/activities/numbers/numbers_activity_page.dart';
import 'package:projeto_crianca/ui/pages/games/encaixar/encaixar_game_page.dart';
import 'package:projeto_crianca/ui/pages/games/memory/memory_game_page.dart';
import 'package:projeto_crianca/ui/pages/games/pardecores/pardecores_game_page.dart';
import 'package:projeto_crianca/ui/pages/games/puzzle/puzzle_game_page.dart';
import 'package:projeto_crianca/ui/pages/games/sombra/sombra_game_page.dart';
import 'package:projeto_crianca/ui/pages/games/paint/paint_game_page.dart';
import 'package:projeto_crianca/ui/pages/about_page.dart';
import 'package:projeto_crianca/ui/pages/activities_page.dart';
import 'package:projeto_crianca/ui/pages/avatar_page.dart';
import 'package:projeto_crianca/ui/pages/activities/expressions/expressions_activity_page.dart';
import 'package:projeto_crianca/ui/pages/games_page.dart';
import 'package:projeto_crianca/ui/pages/home_page.dart';
import 'package:projeto_crianca/ui/pages/localize_page.dart';
import 'package:projeto_crianca/ui/pages/login_page.dart';
import 'package:projeto_crianca/ui/pages/profile_page.dart';
import 'package:projeto_crianca/ui/pages/register_page.dart';
import 'package:projeto_crianca/ui/pages/activities/routines/routines_activity_page.dart';
import 'package:projeto_crianca/ui/pages/settings_page.dart';
import 'package:projeto_crianca/ui/pages/splash_page.dart';
import 'package:projeto_crianca/ui/pages/welcome_page.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.welcome,
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
      binding: LocalizePageBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsPage(),
      binding: SettingsPageBinding(),
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutPage(),
      binding: AboutPageBinding(),
    ),
    GetPage(
      name: AppRoutes.avatar,
      page: () => const AvatarPage(),
      binding: AvatarPageBinding(),
    ),
    GetPage(
      name: AppRoutes.encaixarGame,
      page: () => EncaixarGamePage(),
    ),
    GetPage(
      name: AppRoutes.routines,
      page: () => const RoutinesActivityPage(),
    ),
    GetPage(
      name: AppRoutes.expressions,
      page: () => const ExpressionsActivityPage(),
    ),
    GetPage(
      name: AppRoutes.memoryGame,
      page: () => MemoryGamePage(),
    ),
    GetPage(
      name: AppRoutes.shadowGame,
      page: () => SombraGamePage(),
    ),
    GetPage(
      name: AppRoutes.puzzleGame,
      page: () => PuzzleGamePage(),
    ),
    GetPage(
      name: AppRoutes.parDeCoresGame,
      page: () => ParDeCoresGamePage(),
    ),
    GetPage(
      name: AppRoutes.alphabetActivity,
      page: () => AlphabetActivityPage(),
    ),
    GetPage(
      name: AppRoutes.numbersActivity,
      page: () => NumbersActivityPage(),
    ),
    GetPage(
      name: AppRoutes.paintGame,
      page: () => const PaintGamePage(),
      binding: PaintGamePageBinding(),
    ),
  ];
}
