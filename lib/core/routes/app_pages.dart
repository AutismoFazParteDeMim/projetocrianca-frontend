import 'package:get/get.dart';
import 'package:projeto_crianca/core/bindings/about_page_binding.dart';
import 'package:projeto_crianca/core/bindings/avatar_page_binding.dart';
import 'package:projeto_crianca/core/bindings/games/paint_game_page_binding.dart';
import 'package:projeto_crianca/core/bindings/home_page_binding.dart';
import 'package:projeto_crianca/core/bindings/localize_page_binding.dart';
import 'package:projeto_crianca/core/bindings/login_page_binding.dart';
import 'package:projeto_crianca/core/bindings/register_page_binding.dart';
import 'package:projeto_crianca/core/bindings/settings_page_binding.dart';
import 'package:projeto_crianca/core/routes/app_routes.dart';
import 'package:projeto_crianca/modules/about/presentation/about_page.dart';
import 'package:projeto_crianca/modules/activities/activities/alphabet/alphabet_activity_page.dart';
import 'package:projeto_crianca/modules/activities/activities/expressions/expressions_activity_page.dart';
import 'package:projeto_crianca/modules/activities/activities/numbers/numbers_activity_page.dart';
import 'package:projeto_crianca/modules/activities/activities/routines/routines_activity_page.dart';
import 'package:projeto_crianca/modules/activities/presentation/activities_page.dart';
import 'package:projeto_crianca/modules/auth/presentation/login_page.dart';
import 'package:projeto_crianca/modules/auth/presentation/register_page.dart';
import 'package:projeto_crianca/modules/avatar/presentation/avatar_page.dart';
import 'package:projeto_crianca/modules/games/games/encaixar/encaixar_game_page.dart';
import 'package:projeto_crianca/modules/games/games/memory/memory_game_page.dart';
import 'package:projeto_crianca/modules/games/games/paint/presentation/paint_game_page.dart';
import 'package:projeto_crianca/modules/games/games/pardecores/pardecores_game_page.dart';
import 'package:projeto_crianca/modules/games/games/puzzle/puzzle_game_page.dart';
import 'package:projeto_crianca/modules/games/games/sombra/sombra_game_page.dart';
import 'package:projeto_crianca/modules/games/presentation/games_page.dart';
import 'package:projeto_crianca/modules/home/presentation/home_page.dart';
import 'package:projeto_crianca/modules/localize/presentation/localize_page.dart';
import 'package:projeto_crianca/modules/settings/presentation/settings_page.dart';
import 'package:projeto_crianca/modules/welcome/presentation/welcome_page.dart';
import 'package:projeto_crianca/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage<dynamic>>[
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
      page: SettingsPage.new,
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
      page: EncaixarGamePage.new,
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
      page: MemoryGamePage.new,
    ),
    GetPage(
      name: AppRoutes.shadowGame,
      page: SombraGamePage.new,
    ),
    GetPage(
      name: AppRoutes.puzzleGame,
      page: PuzzleGamePage.new,
    ),
    GetPage(
      name: AppRoutes.parDeCoresGame,
      page: ParDeCoresGamePage.new,
    ),
    GetPage(
      name: AppRoutes.alphabetActivity,
      page: AlphabetActivityPage.new,
    ),
    GetPage(
      name: AppRoutes.numbersActivity,
      page: NumbersActivityPage.new,
    ),
    GetPage(
      name: AppRoutes.paintGame,
      page: () => const PaintGamePage(),
      binding: PaintGamePageBinding(),
    ),
  ];
}
