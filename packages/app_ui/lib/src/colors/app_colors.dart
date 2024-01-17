import 'package:flutter/material.dart';
//ignore_for_file:public_member_api_docs

/// Defines the color palette for the App UI Kit.
abstract class TempAppColors {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF3C5BA9),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDAE1FF),
    onPrimaryContainer: Color(0xFF001849),
    secondary: Color(0xFF585E71),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFDDE2F9),
    onSecondaryContainer: Color(0xFF151B2C),
    tertiary: Color(0xFF735471),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFED6F9),
    onTertiaryContainer: Color(0xFF2B122B),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFEFBFF),
    onBackground: Color(0xFF1B1B1F),
    surface: Color(0xFFFEFBFF),
    onSurface: Color(0xFF1B1B1F),
    surfaceVariant: Color(0xFFE1E2EC),
    onSurfaceVariant: Color(0xFF45464F),
    outline: Color(0xFF757680),
    onInverseSurface: Color(0xFFF2F0F4),
    inverseSurface: Color(0xFF303034),
    inversePrimary: Color(0xFFB3C5FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF3C5BA9),
    outlineVariant: Color(0xFFC5C6D0),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFB3C5FF),
    onPrimary: Color(0xFF002B74),
    primaryContainer: Color(0xFF20428F),
    onPrimaryContainer: Color(0xFFDAE1FF),
    secondary: Color(0xFFC0C6DD),
    onSecondary: Color(0xFF2A3042),
    secondaryContainer: Color(0xFF414659),
    onSecondaryContainer: Color(0xFFDDE2F9),
    tertiary: Color(0xFFE1BBDC),
    onTertiary: Color(0xFF422741),
    tertiaryContainer: Color(0xFF5A3D58),
    onTertiaryContainer: Color(0xFFFED6F9),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1B1B1F),
    onBackground: Color(0xFFE4E2E6),
    surface: Color(0xFF1B1B1F),
    // onSurface: Color(0xFFE4E2E6),
    onSurface: Colors.white,
    surfaceVariant: Color(0xFF45464F),
    onSurfaceVariant: Color(0xFFC5C6D0),
    outline: Color(0xFF8F909A),
    onInverseSurface: Color(0xFF1B1B1F),
    inverseSurface: Color(0xFFE4E2E6),
    inversePrimary: Color(0xFF3C5BA9),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFB3C5FF),
    outlineVariant: Color(0xFF45464F),
    scrim: Color(0xFF000000),
  );
}

abstract class AppColors {
  static const darkColorScheme = AppColorScheme(
    background: Colors.black,
    primaryColor: Color(0xFF4185F4),
    inputBorderColor: Color(0x1AFFFFFF),
    labelTextColor: Color(0xFF9A9BAE),
    inputTextColor: Color(0xFFFFFFFF),
    appBar: Color(0xFF292929),
    secondaryAppBar: Color(0xFF333333),
    onAppBarLabel: Color(0xFF484848),
  );

  static const lightColorScheme = AppColorScheme(
    background: Colors.white,
    primaryColor: Color(0xFF4185F4),
    inputBorderColor: Color(0x1AFFFFFF),
    labelTextColor: Color(0xFF9A9BAE),
    inputTextColor: Color(0xFFFFFFFF),
    appBar: Color(0xFF292929),
    secondaryAppBar: Color(0xFF333333),
    onAppBarLabel: Color(0xFF484848),
  );
}

class AppColorScheme {
  const AppColorScheme({
    required this.background,
    required this.primaryColor,
    required this.inputBorderColor,
    required this.labelTextColor,
    required this.inputTextColor,
    required this.appBar,
    required this.secondaryAppBar,
    required this.onAppBarLabel
  });

  final Color background;
  final Color primaryColor;
  final Color inputBorderColor;
  final Color labelTextColor;
  final Color inputTextColor;
  final Color appBar;
  final Color secondaryAppBar;
  final Color onAppBarLabel;
}
