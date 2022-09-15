import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class ThemeMetrics extends ThemeExtension<ThemeMetrics> {
  final EdgeInsets? padding;
  final double? gap;
  final double? headerHeight;

  const ThemeMetrics({
    required this.padding,
    required this.gap,
    required this.headerHeight,
  });

  @override
  ThemeMetrics copyWith({
    EdgeInsets? padding,
    double? gap,
    double? headerHeight,
  }) {
    return ThemeMetrics(
      padding: padding ?? this.padding,
      gap: gap ?? this.gap,
      headerHeight: headerHeight ?? this.headerHeight,
    );
  }

  @override
  ThemeMetrics lerp(covariant ThemeExtension<ThemeMetrics>? other, double t) {
    if (other is! ThemeMetrics) {
      return this;
    }

    return ThemeMetrics(
      padding: EdgeInsets.lerp(padding, other.padding, t),
      gap: lerpDouble(gap, other.gap, t),
      headerHeight: lerpDouble(headerHeight, other.headerHeight, t),
    );
  }

  double? toInt(EdgeInsets? padding) {
    return padding?.top.toDouble();
  }
}

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color? primary;
  final Color? primaryShadow;
  final Color? onPrimary;
  final Color? secondary;
  final Color? secondaryShadow;
  final Color? onSecondary;
  final Color? error;
  final Color? errorShadow;
  final Color? success;
  final Color? sucessShadow;
  final Color? warning;
  final Color? warningShadow;
  final Color? text;
  final Color? background;

  const ThemeColors({
    required this.primary,
    required this.primaryShadow,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryShadow,
    required this.onSecondary,
    required this.error,
    required this.errorShadow,
    required this.success,
    required this.sucessShadow,
    required this.warning,
    required this.warningShadow,
    required this.text,
    required this.background,
  });

  @override
  ThemeColors copyWith({
    Color? primary,
    Color? primaryShadow,
    Color? onPrimary,
    Color? secondary,
    Color? secondaryShadow,
    Color? onSecondary,
    Color? error,
    Color? errorShadow,
    Color? success,
    Color? sucessShadow,
    Color? warning,
    Color? warningShadow,
    Color? text,
    Color? background,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      primaryShadow: primaryShadow ?? this.primaryShadow,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      secondaryShadow: secondaryShadow ?? this.secondaryShadow,
      onSecondary: onSecondary ?? this.onSecondary,
      error: error ?? this.error,
      errorShadow: errorShadow ?? this.errorShadow,
      success: success ?? this.success,
      sucessShadow: sucessShadow ?? this.sucessShadow,
      warning: warning ?? this.warning,
      warningShadow: warningShadow ?? this.warningShadow,
      text: text ?? this.text,
      background: background ?? this.background,
    );
  }

  @override
  ThemeColors lerp(covariant ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      primary: Color.lerp(primary, other.primary, t),
      primaryShadow: Color.lerp(primaryShadow, other.primaryShadow, t),
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      secondaryShadow: Color.lerp(secondaryShadow, other.secondaryShadow, t),
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t),
      error: Color.lerp(error, other.error, t),
      errorShadow: Color.lerp(errorShadow, other.errorShadow, t),
      success: Color.lerp(success, other.success, t),
      sucessShadow: Color.lerp(sucessShadow, other.sucessShadow, t),
      warning: Color.lerp(warning, other.warning, t),
      warningShadow: Color.lerp(warningShadow, other.warningShadow, t),
      text: Color.lerp(text, other.text, t),
      background: Color.lerp(background, other.background, t),
    );
  }
}
