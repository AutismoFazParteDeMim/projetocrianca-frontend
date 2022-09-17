import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class AppTheme {
  final bool isDark;

  static const _lightColors = ThemeColors(
    primary: Color(0xFF00A7DF),
    primaryShadow: Color(0xFF0093C4),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFE6E6E6),
    secondaryShadow: Color(0xFF979797),
    onSecondary: Color(0xFF3D3D3D),
    error: Color(0xFFEA4335),
    errorShadow: Color(0xFFB92013),
    success: Color(0xFF25D366),
    sucessShadow: Color(0xFF1EAE54),
    warning: Color(0xFFFCC936),
    warningShadow: Color(0xFFC99603),
    text: Color(0xFF3D3D3D),
    background: Color(0xFFFFFFFF),
  );

  static const _darkColors = ThemeColors(
    primary: Color(0xFF71BA51),
    primaryShadow: Color(0xFF568F3D),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF60666F),
    secondaryShadow: Color(0xFF979797),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFEA4335),
    errorShadow: Color(0xFFB92013),
    success: Color(0xFF25D366),
    sucessShadow: Color(0xFF1EAE54),
    warning: Color(0xFFFCC936),
    warningShadow: Color(0xFFC99603),
    text: Color(0xFFFFFFFF),
    background: Color(0xFF3E4651),
  );

  AppTheme({required this.isDark});

  late final _theme = ThemeData(
    useMaterial3: false,
    extensions: <ThemeExtension<dynamic>>[
      ThemeMetrics(
        padding: const EdgeInsets.all(16),
        gap: 16,
        headerHeight: 100,
        borderRadius: BorderRadius.circular(16),
      ),
      isDark ? _darkColors : _lightColors,
    ],
  );

  ThemeData getTheme() {
    final ThemeMetrics metrics = _theme.extension<ThemeMetrics>()!;
    final ThemeColors colors = _theme.extension<ThemeColors>()!;

    return _theme.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ).copyWith(
        primary: colors.primary,
        error: colors.error,
        background: colors.background,
      ),
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.background,
      dialogBackgroundColor: colors.background,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            headlineLarge: const TextStyle(fontWeight: FontWeight.w700),
            headlineMedium: const TextStyle(fontWeight: FontWeight.w700),
            headlineSmall: const TextStyle(fontWeight: FontWeight.w700),
            titleLarge: const TextStyle(fontWeight: FontWeight.w700),
            titleMedium: const TextStyle(fontWeight: FontWeight.w700),
            titleSmall: const TextStyle(fontWeight: FontWeight.w700),
          )
          .apply(
            bodyColor: colors.text,
            displayColor: colors.text,
          ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        filled: true,
        fillColor: colors.secondary,
        border: OutlineInputBorder(
          borderRadius: metrics.borderRadius,
          borderSide: BorderSide(color: colors.secondaryShadow),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: metrics.borderRadius,
          borderSide: BorderSide(color: colors.secondaryShadow),
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: metrics.borderRadius,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(colors.onSecondary),
        trackColor: MaterialStateProperty.all<Color>(colors.secondaryShadow),
      ),
      iconTheme: IconThemeData(color: colors.text),
    );
  }
}
