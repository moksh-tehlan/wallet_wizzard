import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
//ignore_for_file:public_member_api_docs

/// snack bar extension
extension ContextExt on BuildContext {
  ///showSnackBar
  void showSnackBar({required String message}) {
    final screenSize = MediaQuery.sizeOf(this);

    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          dismissDirection: DismissDirection.up,
          margin: const EdgeInsets.all(12)
              .copyWith(bottom: screenSize.height - 100),
        ),
      );
  }
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}

extension ColorThemeExtension on BuildContext {
  bool get isDarkMode {
    return MediaQuery.of(this).platformBrightness == Brightness.dark;
  }

  ColorScheme get colorScheme {
    return isDarkMode
        ? TempAppColors.darkColorScheme
        : TempAppColors.lightColorScheme;
  }

  AppColorScheme get appColorScheme {
    return isDarkMode ? AppColors.darkColorScheme : AppColors.lightColorScheme;
  }
}
