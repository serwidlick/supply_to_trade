import 'package:flutter/material.dart';
import 'package:supply_to_trade/shared/theme/app_colours_schemes.dart';

/// AppTheme class that provides light and dark theme data for the application.
class AppTheme {
  /// Provides light theme data for the application.
  static ThemeData get lightTheme => ThemeData(
    colorScheme: AppColorSchemes.light,
    scaffoldBackgroundColor: AppColorSchemes.light.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorSchemes.light.primary,
      foregroundColor: AppColorSchemes.light.onPrimary,
    ),
    textTheme: const TextTheme().apply(
      bodyColor: AppColorSchemes.light.onSurface,
      displayColor: AppColorSchemes.light.onSurface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: AppColorSchemes.light.onSurface.withValues(alpha: 0.6),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColorSchemes.light.onSurface.withValues(alpha: 0.2),
        ),
      ),
    ),
  );

  /// Provides dark theme data for the application.
  static ThemeData get darkTheme => ThemeData(
    colorScheme: AppColorSchemes.dark,
    scaffoldBackgroundColor: AppColorSchemes.dark.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorSchemes.dark.primary,
      foregroundColor: AppColorSchemes.dark.onPrimary,
    ),
    textTheme: const TextTheme().apply(
      bodyColor: AppColorSchemes.dark.onSurface,
      displayColor: AppColorSchemes.dark.onSurface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: AppColorSchemes.dark.onSurface.withValues(alpha: 0.6),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColorSchemes.dark.onSurface.withValues(alpha: 0.2),
        ),
      ),
    ),
  );
}
