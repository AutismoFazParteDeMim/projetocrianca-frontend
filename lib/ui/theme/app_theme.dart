import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class AppTheme {
  final _theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00A7DF),
    ).copyWith(
      primary: const Color(0xFF00A7DF),
      error: const Color(0xFFEA4335),
      background: const Color(0xFFFFFFFF),
    ),
    primaryColor: const Color(0xFF00A7DF),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    dialogBackgroundColor: const Color(0xFFFFFFFF),
    brightness: Brightness.light,
    useMaterial3: false,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
        .copyWith(
          headlineLarge: const TextStyle(fontWeight: FontWeight.w700),
          headlineMedium: const TextStyle(fontWeight: FontWeight.w700),
          headlineSmall: const TextStyle(fontWeight: FontWeight.w700),
          titleLarge: const TextStyle(fontWeight: FontWeight.w700),
          titleMedium: const TextStyle(fontWeight: FontWeight.w700),
          titleSmall: const TextStyle(fontWeight: FontWeight.w700),
        )
        .apply(
          bodyColor: const Color(0xFF3D3D3D),
          displayColor: const Color(0xFF3D3D3D),
        ),
    extensions: <ThemeExtension<dynamic>>[
      ThemeMetrics(
        padding: const EdgeInsets.all(16),
        gap: 16,
        headerHeight: 100,
        borderRadius: BorderRadius.circular(16),
      ),
      const ThemeColors(
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
      )
    ],
  );

  ThemeData getTheme() {
    final ThemeMetrics metrics = _theme.extension<ThemeMetrics>()!;
    final ThemeColors colors = _theme.extension<ThemeColors>()!;

    return _theme.copyWith(
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
    );
  }
}
