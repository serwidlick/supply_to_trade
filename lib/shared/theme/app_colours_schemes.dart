// Ignoring because its temporary and will be removed in the future.
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

/// Store for app colours and themes
class AppColorSchemes {
  /// Provides light and dark color schemes suitable for a construction industry app.
  /// The light scheme features warm, earthy tones with a professional look,
  /// while the dark scheme uses muted, industrial colors for a rugged, modern feel.
  static ColorScheme get light => const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF887C72), // Warm taupe brown
    onPrimary: Colors.white,
    secondary: Color(0xFFFFEA01), // Bright gold accent
    onSecondary: Color(0xFF2C3E50), // Dark slate
    error: Color(0xFFE74C3C), // Professional red
    onError: Colors.white,
    surface: Color(0xFFFAF9F7), // Warm off-white (cream tone)
    onSurface: Color(0xFF2C3E50), // Dark charcoal for text
    surfaceContainerHighest: Color(
      0xFFF5F3F0,
    ), // Slightly warmer white for cards
    tertiary: Color(0xFFA0958B), // Muted brown-grey
    onTertiary: Color(0xFF2C3E50),
  );

  /// Provides a dark color scheme with rugged, industrial tones.
  static ColorScheme get dark => const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF9B8B7A), // Muted construction brown
    onPrimary: Color(0xFF2C2C2C),
    secondary: Color(0xFFE6B800), // Work-site yellow (safety vest inspired)
    onSecondary: Color(0xFF2C2C2C),
    error: Color(0xFFE57373), // Practical red
    onError: Color(0xFF2C2C2C),
    surface: Color(0xFF2C2C2C), // Concrete grey
    onSurface: Color(0xFFE0E0E0), // Clean white text
    surfaceContainerHighest: Color(0xFF3A3A3A), // Tool steel grey
    tertiary: Color(0xFF757575), // Industrial grey
    onTertiary: Color(0xFFE0E0E0),
  );

  // Alternative rugged/industrial palettes for construction industry:

  /// Provides a dark color scheme inspired by construction blueprints.
  static const ColorScheme darkBlueprint = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF8D7B68), // Weathered wood brown
    onPrimary: Colors.white,
    secondary: Color(0xFFFFB300), // Construction orange-yellow
    onSecondary: Color(0xFF2C2C2C),
    error: Color(0xFFFF5722), // Safety orange-red
    onError: Colors.white,
    surface: Color(0xFF37474F), // Blueprint blue-grey
    onSurface: Color(0xFFECEFF1),
    surfaceContainerHighest: Color(0xFF455A64), // Steel blue-grey
    tertiary: Color(0xFF78909C), // Tool metal grey
    onTertiary: Colors.white,
  );

  /// Provides a dark color scheme inspired by concrete and steel.
  static const ColorScheme darkIndustrial = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF8A7968), // Aged wood
    onPrimary: Colors.white,
    secondary: Color(0xFFF57F17), // High-vis yellow
    onSecondary: Color(0xFF2C2C2C),
    error: Color(0xFFD84315), // Safety red
    onError: Colors.white,
    surface: Color(0xFF424242), // Concrete grey
    onSurface: Color(0xFFE0E0E0),
    surfaceContainerHighest: Color(0xFF616161), // Rebar grey
    tertiary: Color(0xFF9E9E9E), // Galvanized steel
    onTertiary: Color(0xFF2C2C2C),
  );
}
