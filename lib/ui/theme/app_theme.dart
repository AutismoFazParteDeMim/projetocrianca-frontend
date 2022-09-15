import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class AppTheme {
  final _theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00A7DF)),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
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
    extensions: const <ThemeExtension<dynamic>>[
      ThemeMetrics(
        padding: EdgeInsets.all(16),
        gap: 16,
        headerHeight: 100,
      ),
      ThemeColors(
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
      appBarTheme: AppBarTheme(
        toolbarHeight: metrics.headerHeight,
        backgroundColor: colors.background,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: _theme.textTheme.titleSmall?.copyWith(fontSize: 24),
        foregroundColor: colors.text,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
  }
}
