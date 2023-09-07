import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wizard/di/service_locator.dart';
import 'package:wallet_wizard/l10n/l10n.dart';
import 'package:wallet_wizard/navigation/routes.dart';
import 'package:wallet_wizard/views/onboarding/view/onboarding_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt.get<AppRouter>();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      theme: const AppTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
